#!/usr/bin/env python3

"""
cluster_wave_propagate.py — drive `propagate_template` across all
unmatched siblings of a matched anchor, in one wave.

The match-acceleration loop currently asks the decomper to:

  1. Pick a matched function as template.
  2. Run `find_pattern_clusters --version eur main 0x...` to get
     unmatched siblings.
  3. For each sibling: invoke `propagate_template.py apply
     --template <path> --target <module> <addr>`.

Step 3 scales linearly with the cluster size — and the top
cluster from #227's smoke test had 156 unmatched siblings. This
tool collapses 1+2+3 into one invocation.

## What it does

Given a matched anchor (module + addr):

  1. Resolves the anchor's `.c` template path by scanning
     `config/<ver>/**/delinks.txt` for the `complete` TU whose
     `.text` range covers the anchor's address.
  2. Calls `find_clusters_for_anchor` to enumerate exact-(size,
     reloc-sig) siblings.
  3. Runs `derive_plan` against each unmatched sibling. Prints a
     summary table (per-target output path + substitution count
     + any `TemplateMismatch` errors).
  4. Optionally emits a shell script of the equivalent
     `propagate_template.py apply` commands so the decomper can
     review individual `.c`'s before bulk-applying.

## What it deliberately does NOT do

No `--apply` mode in v1. Writing N `.c` files at once is a very
large change; the decomper should review each `derive_plan`
output (which `propagate_template apply` already prints in detail)
before bulk-writing. Add `--apply` if the decomper signals that
manual review of each plan is unnecessary.

## Where this fits

| Tool                          | Question answered                         |
|-------------------------------|-------------------------------------------|
| `find_pattern_clusters.py`    | Where ARE the ready-to-propagate clusters? |
| `propagate_template.py apply` | Apply ONE template to ONE sibling.         |
| `cluster_wave_propagate.py`   | **Drive a whole wave from one anchor.**    |

## Usage

    # Plan a wave (dry-run, default).
    python tools/cluster_wave_propagate.py --version eur main 0x020498f0

    # Same, capped at 20 targets per run.
    python tools/cluster_wave_propagate.py --version eur \\
        main 0x020498f0 --max 20

    # Emit a shell script of equivalent `propagate_template apply`
    # commands; decomper reviews + runs.
    python tools/cluster_wave_propagate.py --version eur \\
        main 0x020498f0 --script-out /tmp/wave.sh

    # Machine-readable plan list.
    python tools/cluster_wave_propagate.py --version eur \\
        main 0x020498f0 --json
"""

from __future__ import annotations

import argparse
import io
import json
import sys
from dataclasses import dataclass
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from analyze_symbols import (  # noqa: E402
    ROOT,
    Symbol,
    load_all,
)
from find_pattern_clusters import (  # noqa: E402
    find_clusters_for_anchor,
)
from next_targets import (  # noqa: E402
    collect_matched_ranges,
    is_addr_matched,
)
from parsers import (  # noqa: E402
    parse_delinks_file,
)
from propagate_template import (  # noqa: E402
    PropagationPlan,
    TemplateMismatch,
    derive_plan,
)


# --------------------------------------------------------------------------- #
# Anchor → template-path resolution
# --------------------------------------------------------------------------- #

def _delinks_paths_for_module(config_dir: Path, module: str) -> Path:
    """The dsd convention:
      main → arm9/delinks.txt
      itcm/dtcm → arm9/{itcm,dtcm}/delinks.txt
      ovNNN → arm9/overlays/ovNNN/delinks.txt
    """
    arm9 = config_dir / "arm9"
    if module == "main":
        return arm9 / "delinks.txt"
    if module in ("itcm", "dtcm"):
        return arm9 / module / "delinks.txt"
    return arm9 / "overlays" / module / "delinks.txt"


def find_template_path(
    anchor: Symbol, config_dir: Path,
) -> Path | None:
    """Scan the module's delinks.txt for the `complete` TU whose
    .text section covers `anchor.addr`. Returns the absolute path
    to the source .c file, or None if no covering TU exists."""
    delinks = _delinks_paths_for_module(config_dir, anchor.module)
    if not delinks.is_file():
        return None
    _module_sections, tus = parse_delinks_file(delinks)
    for tu in tus:
        if tu.get("status") != "complete":
            continue
        source = tu.get("source", "")
        if not source.startswith("src/"):
            continue
        for _section, start, end in tu.get("sections", []):
            if start <= anchor.addr < end:
                return ROOT / source
    return None


# --------------------------------------------------------------------------- #
# Wave plan
# --------------------------------------------------------------------------- #

@dataclass(frozen=True)
class Skipped:
    """A sibling that derive_plan refused (TemplateMismatch / value
    error)."""
    module: str
    addr: int
    reason: str


@dataclass(frozen=True)
class WavePlan:
    """The full plan for one cluster-wave run."""
    template_path: Path
    anchor: Symbol
    plans: tuple[PropagationPlan, ...]
    skipped: tuple[Skipped, ...]
    cluster_total_unmatched: int   # before --max truncation
    capped: bool                   # True if --max truncated the wave


def build_wave(
    anchor: Symbol,
    template_path: Path,
    modules: dict,
    matched: dict,
    *,
    max_targets: int | None = None,
) -> WavePlan:
    """Run derive_plan against every unmatched sibling of `anchor`.

    `max_targets` caps the wave size — useful for staging large
    clusters across multiple PRs (the top #227 cluster has 156
    unmatched; the decomper might want to ship 20 at a time).
    """
    cluster = find_clusters_for_anchor(anchor, modules, matched)
    if cluster is None:
        return WavePlan(
            template_path=template_path,
            anchor=anchor,
            plans=(),
            skipped=(),
            cluster_total_unmatched=0,
            capped=False,
        )

    targets = list(cluster.unmatched)
    total = len(targets)
    capped = False
    if max_targets is not None and len(targets) > max_targets:
        targets = targets[:max_targets]
        capped = True

    plans: list[PropagationPlan] = []
    skipped: list[Skipped] = []
    for sib in targets:
        try:
            p = derive_plan(template_path, sib.module, sib.addr, modules)
            plans.append(p)
        except (TemplateMismatch, ValueError) as e:
            skipped.append(Skipped(
                module=sib.module, addr=sib.addr, reason=str(e),
            ))
    return WavePlan(
        template_path=template_path,
        anchor=anchor,
        plans=tuple(plans),
        skipped=tuple(skipped),
        cluster_total_unmatched=total,
        capped=capped,
    )


# --------------------------------------------------------------------------- #
# Rendering
# --------------------------------------------------------------------------- #

def render_text(wave: WavePlan) -> str:
    lines: list[str] = []
    rel_template = (
        wave.template_path.relative_to(ROOT)
        if wave.template_path.is_absolute()
        and ROOT in wave.template_path.parents
        else wave.template_path
    )
    lines.append(
        f"Wave from `{wave.anchor.name}` "
        f"({wave.anchor.module}|0x{wave.anchor.addr:08x})",
    )
    lines.append(f"  Template: {rel_template}")
    if wave.cluster_total_unmatched == 0:
        lines.append("  No unmatched siblings — nothing to propagate.")
        return "\n".join(lines)
    lines.append(
        f"  Cluster: {wave.cluster_total_unmatched} unmatched "
        f"sibling(s) total"
        f"{' (capped by --max)' if wave.capped else ''}",
    )
    lines.append(
        f"  Ready: {len(wave.plans)}  Skipped: {len(wave.skipped)}",
    )
    lines.append("")
    if wave.plans:
        lines.append("Ready to propagate:")
        for p in wave.plans:
            try:
                out_rel = p.output_path.relative_to(ROOT)
            except ValueError:
                out_rel = p.output_path
            lines.append(
                f"  - {p.target_module:6s} 0x{p.target_addr:08x} "
                f"-> {out_rel}  ({len(p.substitutions)} subs)",
            )
        lines.append("")
    if wave.skipped:
        lines.append(f"Skipped ({len(wave.skipped)}):")
        for s in wave.skipped[:10]:
            lines.append(
                f"  - {s.module:6s} 0x{s.addr:08x}  {s.reason}",
            )
        if len(wave.skipped) > 10:
            lines.append(f"  - … (+{len(wave.skipped) - 10} more)")
    return "\n".join(lines)


def render_script(wave: WavePlan, *, version: str) -> str:
    """A bash script of equivalent `propagate_template.py apply`
    commands — decomper can pipe to bash, or open + review + run
    selected lines."""
    try:
        rel_template = wave.template_path.relative_to(ROOT)
    except ValueError:
        rel_template = wave.template_path

    lines: list[str] = []
    lines.append("#!/usr/bin/env bash")
    lines.append(
        f"# Cluster wave from {wave.anchor.name} "
        f"({wave.anchor.module}|0x{wave.anchor.addr:08x})"
    )
    lines.append(
        f"# Template: {rel_template}"
    )
    lines.append(
        f"# {len(wave.plans)} target(s) "
        f"(of {wave.cluster_total_unmatched} unmatched siblings)."
    )
    lines.append("# Review each command — or pipe to `bash` if you "
                 "trust the wave end-to-end.")
    lines.append("set -euo pipefail")
    lines.append("")
    if not wave.plans:
        lines.append("echo 'No ready targets in this wave.'")
        return "\n".join(lines) + "\n"

    for p in wave.plans:
        lines.append(
            f"python tools/propagate_template.py apply "
            f"--version {version} "
            f"--template {rel_template} "
            f"--target {p.target_module} 0x{p.target_addr:08x}",
        )
    return "\n".join(lines) + "\n"


def render_json(wave: WavePlan) -> str:
    try:
        rel_template = str(wave.template_path.relative_to(ROOT))
    except ValueError:
        rel_template = str(wave.template_path)

    payload = {
        "anchor": {
            "module": wave.anchor.module,
            "addr": wave.anchor.addr,
            "name": wave.anchor.name,
        },
        "template_path": rel_template,
        "cluster_total_unmatched": wave.cluster_total_unmatched,
        "capped": wave.capped,
        "ready": [
            {
                "module": p.target_module,
                "addr": p.target_addr,
                "name": p.target_name,
                "output_path": str(
                    p.output_path.relative_to(ROOT)
                    if (p.output_path.is_absolute()
                        and ROOT in p.output_path.parents)
                    else p.output_path
                ),
                "substitutions": len(p.substitutions),
            } for p in wave.plans
        ],
        "skipped": [
            {
                "module": s.module,
                "addr": s.addr,
                "reason": s.reason,
            } for s in wave.skipped
        ],
    }
    return json.dumps(payload, indent=2)


# --------------------------------------------------------------------------- #
# CLI
# --------------------------------------------------------------------------- #

def main() -> int:
    try:
        sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    except (AttributeError, io.UnsupportedOperation):
        pass

    ap = argparse.ArgumentParser(
        description=(
            "Drive `propagate_template` across all unmatched "
            "siblings of a matched anchor in one wave."
        ),
    )
    ap.add_argument("--version", default="eur")
    ap.add_argument(
        "module", help="Anchor module (e.g. main, ov005).",
    )
    ap.add_argument(
        "addr", help="Anchor address (hex).",
    )
    ap.add_argument(
        "--max", type=int, default=None,
        help="Cap on the number of siblings included in the wave "
             "(default: unlimited). Useful for staging large "
             "clusters across multiple PRs.",
    )
    ap.add_argument(
        "--script-out", type=Path, default=None,
        help="Write the equivalent `propagate_template apply` "
             "commands to this path as a bash script.",
    )
    ap.add_argument(
        "--json", action="store_true",
        help="Emit JSON instead of plain-text plan summary.",
    )
    args = ap.parse_args()

    config_dir = ROOT / "config" / args.version
    if not config_dir.is_dir():
        print(f"error: {config_dir} not found.", file=sys.stderr)
        return 2

    modules = load_all(config_dir)
    matched = collect_matched_ranges(config_dir)

    md = modules.get(args.module)
    if md is None:
        print(
            f"error: module `{args.module}` not found.",
            file=sys.stderr,
        )
        return 2
    addr = int(args.addr, 0)
    anchor = md.by_addr.get(addr)
    if anchor is None:
        print(
            f"error: no symbol at {args.module}|0x{addr:08x}.",
            file=sys.stderr,
        )
        return 2
    if not anchor.is_function:
        print(
            f"error: {anchor.name} is not a function.",
            file=sys.stderr,
        )
        return 2
    if not is_addr_matched(matched, anchor.module, anchor.addr):
        print(
            f"error: anchor {anchor.name} is not matched. The wave "
            "tool needs a matched template; pick a matched anchor "
            "(check `tools/find_pattern_clusters.py` to find one).",
            file=sys.stderr,
        )
        return 2

    template_path = find_template_path(anchor, config_dir)
    if template_path is None:
        print(
            f"error: no `complete` TU in delinks.txt covers "
            f"{anchor.module}|0x{anchor.addr:08x}. The anchor is "
            "marked matched but no source file is registered for "
            "it — check delinks.txt.",
            file=sys.stderr,
        )
        return 2

    wave = build_wave(
        anchor, template_path, modules, matched,
        max_targets=args.max,
    )

    if args.json:
        print(render_json(wave))
    else:
        print(render_text(wave))

    if args.script_out:
        script = render_script(wave, version=args.version)
        args.script_out.parent.mkdir(parents=True, exist_ok=True)
        args.script_out.write_text(script, encoding="utf-8")
        # Make it executable for convenience.
        args.script_out.chmod(0o755)
        print(
            f"\nWrote {args.script_out} "
            f"({len(wave.plans)} apply command(s)).",
            file=sys.stderr,
        )
    return 0


if __name__ == "__main__":
    sys.exit(main())
