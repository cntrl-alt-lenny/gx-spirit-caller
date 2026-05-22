#!/usr/bin/env python3

"""
predict_walls.py — disasm-based codegen-wall prediction for the
code-decomp resumption wave (brief 189).

For each function in `config/<region>/**/symbols.txt`, extracts the
ARM bytes from the matching `extract/<region>/.../<module>.bin`,
disassembles via `arm-none-eabi-objdump`, and applies a regex-based
classifier to detect recognition cues from
[`docs/research/codegen-walls.md`](../docs/research/codegen-walls.md).

The output is a JSON dictionary keyed by `module:addr` with the
predicted walls per function. `tools/next_targets.py` consumes
this file (when present) to emit wall predictions in the
`reason` column of `next_targets.md` / `next_targets.json`.

What walls this predictor recognises
------------------------------------

The cheap-to-detect subset of the wall taxonomy — the ones whose
recognition cue is a localised regex pattern in disasm. More
subtle walls (e.g. C-2 local-pointer reuse, C-9 saturating-cap
predicate) need source-level context and aren't emitted here.

  - **StyleA** — `bx lr` epilogue separate from `ldmfd sp!, {...}`
    (vs Style B's `pop {..., pc}` single-instruction return).
    Routes through `.legacy.c` (mwcc 1.2/sp2p3).
  - **C-1** — 3+ consecutive predicated-execution instructions
    forming a fused early-return-equivalent chain. mwcc 2.0's
    aggressive predication vs an early-return source — see
    codegen-walls.md § C-1.
  - **C-12** — prologue pushes `r0` (arg-preserving thunk shape).
    `asm void` + `nofralloc` recipe per codegen-walls.md § C-12.
  - **C-15** — constant-pair derivation: `mov rN, #K; mvn rM, #0`
    OR `mov rN, #K; sub rM, rN, #1`. Routes through `.legacy.c`.
  - **C-22** — 2+ adjacent `bic; orr` pairs at different bit
    positions. Declare each window as its own C bitfield.
  - **C-23** — 3+ `ldr rN, [pc, #imm]` loading MMIO addresses
    (`0x04000xxx` range). Routes through `.legacy.c`.
  - **C-24** — `ldr rN, [pool]; bx rN` indirect-call dispatch
    (not `bx lr`). Routes through `.legacy_sp3.c`.
  - **P-9** — conditional `mvn{cond}` — mwcc 2.0 may not
    peephole this; permuter via brief 098.

Walls NOT detected here (require source context):

  - C-2 / C-9 / C-17 / C-25 / C-28 / S-1 / S-2 — recognition
    requires understanding the C-level intent that the asm
    encodes ambiguously. Decomper should consult
    `docs/research/codegen-walls.md` directly when the
    predictor reports no wall but the asm is non-trivial.

Usage
-----

  # Predict walls for every function in EUR config.
  python tools/predict_walls.py --version eur \\
      --out build/eur/analysis/wall_predictions.json

  # Predict for a single function (debugging):
  python tools/predict_walls.py --version eur --module main \\
      --address 0x02094d18 --size 0x34

  # JSON output for tool chaining (next_targets.py consumes this):
  python tools/predict_walls.py --version eur \\
      --out build/eur/analysis/wall_predictions.json --quiet

Brief 189 ships this as the source of truth for
`tools/next_targets.py`'s wall-prediction emission. Re-run after
shipping matches to keep the predictions current.

Dependencies
------------

  - `arm-none-eabi-objdump` on `PATH` (Homebrew:
    `brew install arm-none-eabi-binutils`).
  - The extracted `.bin` files in `extract/<region>/`.
  - The parsed `config/<region>/**/symbols.txt` + `delinks.txt`.

If `arm-none-eabi-objdump` is unavailable, the script exits 2 with
a clear message — `next_targets.py` falls back to its no-wall-
prediction behaviour.

See also
--------

  - `docs/research/codegen-walls.md` — the wall taxonomy this
    predictor encodes.
  - `docs/research/code-decomp-resumption-queue.md` — brief 187
    Part 2 + brief 189 Part 1 audit results.
  - `docs/research/first-wave-wall-*.md` — top-3-wall research
    notes from brief 189 Part 2.
"""

from __future__ import annotations

import argparse
import json
import re
import shutil
import subprocess
import sys
from dataclasses import dataclass
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent

sys.path.insert(0, str(Path(__file__).resolve().parent))
from analyze_symbols import parse_symbols_file  # noqa: E402


VALID_REGIONS = ("eur", "usa", "jpn")


def _module_text_base(region: str, module: str) -> int | None:
    """Read `.text` start VA from the module's delinks.txt."""
    if module == "main":
        path = ROOT / f"config/{region}/arm9/delinks.txt"
    elif module in ("itcm", "dtcm"):
        path = ROOT / f"config/{region}/arm9/{module}/delinks.txt"
    elif module.startswith("ov"):
        path = ROOT / f"config/{region}/arm9/overlays/{module}/delinks.txt"
    else:
        return None
    if not path.is_file():
        return None
    text = path.read_text(encoding="utf-8")
    m = re.search(r"\.text\s+start:0x([0-9a-f]+)", text)
    return int(m.group(1), 16) if m else None


def _module_bin_path(region: str, module: str) -> Path:
    if module == "main":
        return ROOT / f"extract/{region}/arm9/arm9.bin"
    if module in ("itcm", "dtcm"):
        return ROOT / f"extract/{region}/arm9/{module}.bin"
    return ROOT / f"extract/{region}/arm9_overlays/{module}.bin"


def disasm_function(
    region: str, module: str, addr: int, size: int,
    *, objdump: str = "arm-none-eabi-objdump",
) -> str | None:
    """Disassemble `size` bytes at `addr` in `module`'s binary."""
    base = _module_text_base(region, module)
    bin_path = _module_bin_path(region, module)
    if base is None or not bin_path.is_file():
        return None
    fo = addr - base
    if fo < 0:
        return None
    r = subprocess.run(
        [
            objdump, "-D", "-b", "binary", "-m", "armv5te",
            f"--start-address=0x{fo:x}",
            f"--stop-address=0x{fo + size:x}",
            str(bin_path),
        ],
        capture_output=True, text=True, timeout=10,
    )
    if r.returncode != 0:
        return None
    return r.stdout


@dataclass
class WallPrediction:
    wall_id: str
    cue: str


def detect_walls(asm: str) -> list[WallPrediction]:
    """Apply the brief 189 regex-based wall classifier to disasm.
    Returns a (possibly empty) list of `WallPrediction`s, ordered
    by detection rule (StyleA → C-12 → C-23 → C-24 → C-22 → C-15
    → C-1 → P-9).

    Pure function — no I/O — so the classifier is unit-testable
    against synthetic asm fixtures.
    """
    walls: list[WallPrediction] = []
    lines = [
        line.strip() for line in asm.splitlines()
        if ":\t" in line and "Disassembly" not in line
    ]
    if not lines:
        return walls

    # ----- Style A vs B epilogue.
    has_bx_lr_epilogue = any(
        "bx\tlr" in line for line in lines[-3:]
    )
    has_pop_pc = (
        any(
            "ldmfd" in line and "pc" in line.split("{", 1)[-1]
            for line in lines if "{" in line
        )
        or any("pop" in line and ", pc" in line for line in lines)
    )
    if has_bx_lr_epilogue and not has_pop_pc:
        walls.append(WallPrediction(
            "StyleA",
            "epilogue uses `bx lr` separate from "
            "`ldmfd sp!, {...}` — `.legacy.c` routing required",
        ))

    # ----- C-12 push-r0 arg-preserving thunk.
    for line in lines[:3]:
        m = re.search(r"(stmfd|push)\s+sp!,?\s*\{([^}]+)\}", line)
        if m and "r0" in m.group(2):
            walls.append(WallPrediction(
                "C-12",
                "prologue pushes r0 — arg-preserving thunk; "
                "`asm void` + `nofralloc` recipe",
            ))
            break

    # ----- C-23 MMIO base-folding.
    pc_loads = sum(
        1 for line in lines
        if re.search(r"ldr\s+\w+,\s*\[pc", line)
    )
    mmio_lits = sum(
        1 for line in lines
        if re.search(r"\.word\s+0x04000", line)
    )
    if pc_loads >= 3 and mmio_lits >= 1:
        walls.append(WallPrediction(
            "C-23",
            f"{pc_loads} pc-relative loads + {mmio_lits} MMIO "
            "literal(s) (0x04000xxx) — `.legacy.c` routing",
        ))

    # ----- C-24 indirect-call dispatch.
    for i in range(len(lines) - 1):
        if "ldr" in lines[i]:
            # `bx rN` (not `bx lr`) or `mov pc, rN`.
            nxt = lines[i + 1]
            m_bx = re.search(r"\bbx\s+(\w+)", nxt)
            if m_bx and m_bx.group(1) != "lr":
                walls.append(WallPrediction(
                    "C-24",
                    "indirect-call dispatch (`ldr rN, [pool]; "
                    "bx rN`) — `.legacy_sp3.c` routing",
                ))
                break

    # ----- C-22 adjacent bitfield write.
    bic_orr_count = 0
    for i in range(len(lines) - 1):
        if "bic" in lines[i] and "orr" in lines[i + 1]:
            bic_orr_count += 1
    if bic_orr_count >= 2:
        walls.append(WallPrediction(
            "C-22",
            f"{bic_orr_count} adjacent `bic`/`orr` pairs — "
            "declare each window as a separate bitfield",
        ))

    # ----- C-15 flat-thunk arg-setup constant pair.
    has_mvn0 = any(
        re.search(r"mvn\s+\w+,\s*#0", line) for line in lines
    )
    has_mov_sub_pair = False
    for i in range(len(lines) - 1):
        if (
            re.search(r"\bmov\s+\w+,\s*#\d+", lines[i])
            and re.search(
                r"\bsub\s+\w+,\s*\w+,\s*#1", lines[i + 1],
            )
        ):
            has_mov_sub_pair = True
            break
    if has_mvn0 or has_mov_sub_pair:
        walls.append(WallPrediction(
            "C-15",
            "constant-pair (#K, ±1) via `mvn`/`mov-sub` — "
            "`.legacy.c` routing if orig has `mvn` form",
        ))

    # ----- C-1 predicated execution chain.
    cond_suffixes = (
        "eq", "ne", "cs", "cc", "mi", "pl", "vs", "vc",
        "hi", "ls", "ge", "lt", "gt", "le",
    )
    pred_run = 0
    max_pred_run = 0
    pred_re = re.compile(
        r":\t[0-9a-f]+ \t(\w+?)("
        + "|".join(cond_suffixes)
        + r")\b",
    )
    for line in lines:
        m = pred_re.search(line)
        if m and m.group(1) not in ("b", "bl", "blx", "bx"):
            pred_run += 1
            max_pred_run = max(max_pred_run, pred_run)
        else:
            pred_run = 0
    if max_pred_run >= 3:
        walls.append(WallPrediction(
            "C-1",
            f"{max_pred_run}-instruction predicated chain — "
            "pure pred-exec vs early-return ambiguity",
        ))

    # ----- P-9 missing mvn{cond} peephole.
    has_cond_mvn = any(
        re.search(
            r"\bmvn(eq|ne|cs|cc|mi|pl|vs|vc|hi|ls|ge|lt|gt|le)\b",
            line,
        )
        for line in lines
    )
    if has_cond_mvn:
        walls.append(WallPrediction(
            "P-9",
            "conditional `mvn{cond}` — mwcc 2.0 may not peephole; "
            "permuter via brief 098",
        ))

    return walls


def predict_module(
    region: str, module: str,
    *, objdump: str = "arm-none-eabi-objdump",
) -> dict[str, list[dict]]:
    """Predict walls for every function symbol in `module`. Returns
    `{f"{module}:0x{addr:08x}": [{"id": ..., "cue": ...}, ...]}`.
    Functions with no detected walls are present with an empty
    list — callers can render "no wall predicted" cleanly.
    """
    if module == "main":
        sym_path = ROOT / f"config/{region}/arm9/symbols.txt"
    elif module in ("itcm", "dtcm"):
        sym_path = ROOT / f"config/{region}/arm9/{module}/symbols.txt"
    else:
        sym_path = ROOT / f"config/{region}/arm9/overlays/{module}/symbols.txt"
    if not sym_path.is_file():
        return {}
    symbols = parse_symbols_file(sym_path, module)
    out: dict[str, list[dict]] = {}
    for s in symbols:
        if s.type != "function":
            continue
        if s.size <= 0:
            continue
        key = f"{module}:0x{s.addr:08x}"
        asm = disasm_function(
            region, module, s.addr, s.size, objdump=objdump,
        )
        if asm is None:
            out[key] = []
            continue
        walls = detect_walls(asm)
        out[key] = [
            {"id": w.wall_id, "cue": w.cue} for w in walls
        ]
    return out


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(
        description=(
            "Predict codegen-wall recognition cues for the EUR "
            "/ USA / JPN config's functions via ARM disasm. "
            "Brief 189 ships this for `next_targets.py` "
            "consumption."
        ),
    )
    ap.add_argument(
        "--version", required=True, choices=VALID_REGIONS,
        help="Region whose config + extract to scan.",
    )
    ap.add_argument(
        "--out", type=Path, default=None,
        help="Output JSON path. Defaults to "
             "`build/<region>/analysis/wall_predictions.json` "
             "when not given.",
    )
    ap.add_argument(
        "--module", default=None,
        help="If set, restrict to a single module "
             "(e.g. 'main', 'ov007'). Default: every module.",
    )
    ap.add_argument(
        "--address", type=lambda s: int(s, 16), default=None,
        help="If set with --module, predict for one function "
             "only and print the result to stdout.",
    )
    ap.add_argument(
        "--size", type=lambda s: int(s, 16), default=None,
        help="Function size (hex). Required with --address.",
    )
    ap.add_argument(
        "--objdump", default="arm-none-eabi-objdump",
        help="Path to ARM objdump binary.",
    )
    ap.add_argument(
        "--quiet", action="store_true",
        help="Suppress summary output (still writes JSON).",
    )
    args = ap.parse_args(argv)

    if shutil.which(args.objdump) is None:
        print(
            f"error: {args.objdump} not found on PATH. Install "
            f"arm-none-eabi-binutils (Homebrew: `brew install "
            f"arm-none-eabi-binutils`).",
            file=sys.stderr,
        )
        return 2

    if args.address is not None:
        if args.module is None or args.size is None:
            print(
                "error: --address requires --module and --size",
                file=sys.stderr,
            )
            return 1
        asm = disasm_function(
            args.version, args.module, args.address, args.size,
            objdump=args.objdump,
        )
        if asm is None:
            print(
                f"error: cannot disassemble {args.module} "
                f"0x{args.address:08x}",
                file=sys.stderr,
            )
            return 1
        walls = detect_walls(asm)
        for w in walls:
            print(f"  {w.wall_id}: {w.cue}")
        if not walls:
            print("  (no wall predicted)")
        return 0

    # Full-scan mode.
    if args.out is None:
        args.out = ROOT / f"build/{args.version}/analysis/wall_predictions.json"
    args.out.parent.mkdir(parents=True, exist_ok=True)

    all_modules = (
        [args.module] if args.module
        else ["main", "itcm"] + [f"ov{i:03d}" for i in range(24)]
    )
    predictions: dict[str, list[dict]] = {}
    for module in all_modules:
        mod_preds = predict_module(
            args.version, module, objdump=args.objdump,
        )
        predictions.update(mod_preds)

    with args.out.open("w", encoding="utf-8") as f:
        json.dump(predictions, f, indent=2, sort_keys=True)
        f.write("\n")

    # Summary line.
    from collections import Counter
    tally: Counter[str] = Counter()
    for walls in predictions.values():
        for w in walls:
            tally[w["id"]] += 1
    if not args.quiet:
        print(
            f"predict_walls: scanned {len(predictions)} functions; "
            f"wall tally:",
            file=sys.stderr,
        )
        for wall_id, count in tally.most_common():
            print(f"  {wall_id}: {count}", file=sys.stderr)
        print(f"wrote {args.out}", file=sys.stderr)
    return 0


if __name__ == "__main__":
    sys.exit(main())
