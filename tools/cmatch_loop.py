#!/usr/bin/env python3
"""cmatch_loop.py — the production c-match loop (brief 619, r7-2).

Composes four already-built pieces that nothing currently chains:

    1. DOSSIER  — retrieve_fewshot (m2c_feed.py, the retriever) + struct
       decls (the module's *_core.h, brief 286+/609/613) + an m2c draft
       skeleton (m2c_feed.py's render/build_context/run_m2c) [+ suggest_
       coercion hints, added AFTER the first compile attempt — see
       `enrich_with_coercion`'s docstring for why suggest_coercion can't
       run pre-compile no matter how step-1/step-2 is phrased].
    2. ONE SERIALIZED compile + fastmatch sweep — fastmatch.match_one(),
       one candidate at a time, no parallel wine calls from this tool.
    3. CLASSIFY each candidate accept / iterate / park.
    4. HAND ACCEPTS to batch_sha1.py for the real gate (opt-in --gate;
       never automatic — see "NOT AUTO-SHIP" below).

NOT AUTO-SHIP (r7-26: "two gate gaps survive fastmatch-RESOLVED"). This
loop's default behavior stops at draft/compile/score: it writes no git
commits, and by default does not even invoke batch_sha1.py. batch_sha1.py
itself never commits either (confirmed by reading it — zero `git`
occurrences) — getting from "accepted" to "shipped" is a deliberate,
separate, brain-gated step, matching docs/research/tool-scout-swarm-
2026-06-19.md's "gate gap is load-bearing" finding: objdiff/fastmatch-
100% is necessary, never sufficient; only the linked 3-region `ninja
sha1` is truth.

PERSISTENCE — "queue re-injection, not a prompt" (the brief's own
phrase). A JSON state file (`--state`, default under build/, gitignored
by convention) tracks each candidate's status (pending / accepted /
iterate / parked) and attempt count across invocations. A plain re-run
with the SAME candidate list automatically skips already-resolved
(accepted/parked) candidates and retries "iterate" ones — no special
"re-inject" code path is needed, since an iterate candidate simply never
leaves the loop's effective queue until it resolves. This deliberately
diverges from batch_carve.py's pattern (confirmed by reading it: batch_
carve keeps NO JSON state file at all — its "done" record is git commits,
since it auto-commits on every green gate, and its "parked" record is a
flat skip-list text file). This loop explicitly does not auto-commit, so
it has no git-based ground truth to derive state from and must track its
own — the same DURABLE, INSPECTABLE, HARNESS-not-PROMPT spirit, adapted
to a tool that stops short of shipping.

r9 CAUTION (brief 611, AGENTS.md LANE STATE): the retriever's HONEST
baseline is family-hit@5 = 53.5%, not the earlier (miscounted, 24-query)
95.8% figure. The dossier's few-shot sibling is a comprehension aid for
a human/agent writing the next draft, never a signal this loop's own
classify() trusts — classify() looks ONLY at fastmatch's real compiled
match_percent. Over-trusting the retriever here would be exactly the
mistake r9 flags.

ATTEMPT_CAP = 3 (r7-10: "attempt-cap = 3, not the peer's 28 — one lane
makes long-tail attempt economics infeasible"). A candidate that hasn't
reached 100% after 3 attempts auto-parks rather than looping forever.

Usage:
    python tools/cmatch_loop.py eur func_02000e34 func_02001e5c \\
        --state build/cmatch_loop/state.json

    python tools/cmatch_loop.py eur --candidates-file queue.txt --gate

    python tools/cmatch_loop.py --canary eur func_0201b6c4 func_0201ada0 \\
        func_020215d8 func_02022260 func_02033f10
"""

from __future__ import annotations

import argparse
import dataclasses
import json
import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
_TOOLS = ROOT / "tools"
if str(_TOOLS) not in sys.path:
    sys.path.insert(0, str(_TOOLS))

import fastmatch  # noqa: E402
import m2c_feed  # noqa: E402
import suggest_coercion  # noqa: E402

DEFAULT_STATE_PATH = ROOT / "build" / "cmatch_loop" / "state.json"
ATTEMPT_CAP = 3  # r7-10


# m2c deliberately leaves uncertain types as `?` and uses `void *` for
# pointer-shaped values.  That is useful for a human draft, but MWCC rejects
# the placeholders before it can produce an object for fastmatch.  The
# compile probe gets a conservative, named-field scaffold: it is explicitly
# a drafting aid, not a claim that these inferred types are byte-correct.
_UNKNOWN_FIELD_RE = re.compile(r"(?:->|\.)\s*(unk[0-9A-Fa-f]+)\b")
_FIELD_BASE_RE = re.compile(
    r"\b([A-Za-z_]\w*)\s*(?:->|\.)\s*unk[0-9A-Fa-f]+\b"
)
_STANDALONE_UNKNOWN_RE = re.compile(r"(?<![A-Za-z0-9_])\?(?![A-Za-z0-9_])")
_RAW_ADDRESS_FIELD_RE = re.compile(
    r"\((?:void|u8|u16|u32|s8|s16|s32)\s+\*\)"
    r"(0x[0-9A-Fa-f]+)->(unk[0-9A-Fa-f]+)"
)
_ADDRESS_DEREF_RE = re.compile(
    r"\*\(&([A-Za-z_]\w*)\s+\+\s+([^;]+?)\)"
)


def prepare_compile_source(source: str) -> str:
    """Make an m2c draft syntactically compilable for the first probe.

    m2c's `?` and `unkNNN` markers are honest uncertainty markers, not C
    syntax.  Give them a small MWCC-compatible scaffold so cmatch_loop can
    distinguish "draft compiled, now iterate on bytes" from "the tool could
    not even create an object".  The transformation intentionally preserves
    the function body and does not promise a match.
    """
    field_names = set(_UNKNOWN_FIELD_RE.findall(source))
    field_bases = set(_FIELD_BASE_RE.findall(source))

    lines = [
        "typedef unsigned char u8;",
        "typedef unsigned short u16;",
        "typedef unsigned int u32;",
        "typedef signed char s8;",
        "typedef signed short s16;",
        "typedef signed int s32;",
        "struct M2CUnknown {",
    ]
    for field in sorted(field_names, key=lambda item: int(item[3:], 16)):
        lines.append(f"    int {field};")
    lines.extend(["};", ""])

    # Pointer-shaped unknown parameters are more useful as the scaffold type
    # than as int pointers, while scalar unknowns remain int-sized MWCC args.
    text = source.replace("? *", "struct M2CUnknown *")
    text = _STANDALONE_UNKNOWN_RE.sub("int", text)

    for name in sorted(field_bases, key=len, reverse=True):
        text = re.sub(rf"\bvoid \*{re.escape(name)}\b",
                      f"struct M2CUnknown *{name}", text)
        text = re.sub(rf"\bint {re.escape(name)}\b",
                      f"struct M2CUnknown {name}", text)
        text = re.sub(rf"\bextern int {re.escape(name)}\b",
                      f"extern struct M2CUnknown {name}", text)

    # m2c emits `(type *)ADDR->unkN` for unknown MMIO bases.  Make the
    # intended pointer/member operation explicit so MWCC accepts it.
    text = _RAW_ADDRESS_FIELD_RE.sub(
        r"((struct M2CUnknown *)\1)->\2", text
    )

    # A few pool/stack expressions dereference an unknown aggregate address.
    # Read those words through a byte-addressed int pointer in the scaffold.
    text = _ADDRESS_DEREF_RE.sub(
        r"*(int *)((char *)&\1 + \2)", text
    )
    return "\n".join(lines) + text


# --------------------------------------------------------------------------- #
# Path derivation (mirrors m2c_feed.find_core_header / fastmatch.ninja_target_path)
# --------------------------------------------------------------------------- #

def module_dir(module: str) -> str:
    """'main' -> 'main'; 'ov002' -> 'overlay002' (m2c_feed.find_core_header's
    own convention, verbatim)."""
    return "main" if module == "main" else f"overlay{module[2:]}"


def src_path(region: str, module: str, func: str, suffix: str = ".c") -> Path:
    """The canonical source path a matched TU for `func` lives (or would
    live) at. EUR is unprefixed; USA/JPN are region-ported copies under
    src/<region>/ (CLAUDE.md's documented convention)."""
    base = ROOT / "src" if region == "eur" else ROOT / "src" / region
    return base / module_dir(module) / f"{func}{suffix}"


# --------------------------------------------------------------------------- #
# Dossier
# --------------------------------------------------------------------------- #

@dataclasses.dataclass
class Dossier:
    """The per-candidate reference bundle (r7-6): a matched-sibling .c via
    the retriever, the module's struct decls, an m2c draft skeleton, and
    (once a compile has happened) suggest_coercion wall hints."""
    func: str
    region: str
    module: str
    fewshot: list[dict] = dataclasses.field(default_factory=list)
    fewshot_error: str | None = None
    struct_header_path: str | None = None
    struct_header_text: str | None = None
    m2c_skeleton: str | None = None
    m2c_error: str | None = None
    coercion_hits: list[dict] | None = None
    coercion_error: str | None = None

    def render_markdown(self) -> str:
        parts = [f"# Dossier: {self.func} ({self.region}/{self.module})", ""]
        parts.append("## Retrieved matched siblings (BM25 few-shot, r9: honest "
                      "baseline family-hit@5 = 53.5% -- a comprehension aid, "
                      "not an oracle)")
        if self.fewshot:
            for ex in self.fewshot:
                parts.append(f"- `{ex['name']}` ({ex['module']}, 0x{ex['addr']:x})")
        elif self.fewshot_error:
            parts.append(f"- (unavailable: {self.fewshot_error})")
        else:
            parts.append("- (none retrieved)")
        parts.append("")
        parts.append("## Struct decls")
        if self.struct_header_path:
            parts.append(f"- `{self.struct_header_path}`")
        else:
            parts.append("- (module has no consolidated *_core.h)")
        parts.append("")
        parts.append("## m2c draft skeleton")
        if self.m2c_skeleton:
            parts.append("```c")
            parts.append(self.m2c_skeleton.rstrip("\n"))
            parts.append("```")
        else:
            parts.append(f"- draft failed: {self.m2c_error}")
        parts.append("")
        parts.append("## suggest_coercion wall hints")
        if self.coercion_hits:
            for hit in self.coercion_hits:
                parts.append(f"- **{hit['wall_id']}** ({hit['confidence']}): "
                              f"{hit['recipe']} — {hit['anchor']}")
        elif self.coercion_error:
            parts.append(f"- (unavailable: {self.coercion_error})")
        else:
            parts.append("- (not yet run — needs a compiled .o; populated after "
                          "the first compile attempt, see enrich_with_coercion)")
        return "\n".join(parts) + "\n"


def build_dossier(region: str, func: str, module: str, *, k: int = 3,
                   objdump: str = "arm-none-eabi-objdump") -> Dossier:
    """Assemble the pre-compile portion of a candidate's dossier: the
    retriever's top-k matched siblings, the module's struct-decl header
    (if any), and an m2c draft skeleton. All three are build-free (need
    only the delinked gap object, not a compile) — coercion hints are
    NOT part of this function; see `enrich_with_coercion`.
    """
    dossier = Dossier(func=func, region=region, module=module)

    # Resolved once, shared by both the retriever and m2c-skeleton steps
    # below (both need the candidate's OWN gap object to disassemble).
    # An earlier version of this function passed retrieve_fewshot an
    # empty-string `obj` instead of this resolved path -- retrieve_fewshot
    # takes `obj` as a caller-supplied object PATH, not something it
    # looks up itself (confirmed by reading its body: it runs
    # `objdump -d <obj>` directly), so that call silently disassembled
    # nothing and every dossier reported "no siblings retrieved" — not a
    # real absence of matches, an unhandled FeedError being swallowed by
    # a too-broad `except Exception: dossier.fewshot = []`. Caught by
    # directly inspecting a real dossier's rendered output and finding
    # "(none retrieved)" for a function objdump could plainly disassemble
    # by hand; fixed by resolving obj_path first and recording any
    # genuine failure in fewshot_error instead of masking it as empty.
    try:
        obj_path = m2c_feed.find_object(region, func, objdump, module=module)
    except Exception as exc:  # noqa: BLE001
        dossier.fewshot_error = f"{type(exc).__name__}: {exc}"
        dossier.m2c_error = f"{type(exc).__name__}: {exc}"
        return dossier

    try:
        examples = m2c_feed.retrieve_fewshot(region, obj_path, func, k, objdump=objdump)
        dossier.fewshot = [
            {"name": ex.name, "module": ex.module, "addr": ex.addr}
            for ex in examples
        ]
    except Exception as exc:  # noqa: BLE001 — advisory; record, don't sink
        # the candidate over a retrieval failure (r9: the retriever is a
        # comprehension aid, not load-bearing for classify()).
        dossier.fewshot_error = f"{type(exc).__name__}: {exc}"

    header = m2c_feed.find_core_header(region, module)
    if header is not None:
        dossier.struct_header_path = str(header.relative_to(ROOT))
        try:
            dossier.struct_header_text = header.read_text()
        except OSError:
            dossier.struct_header_text = None

    try:
        s_text = _disasm_to_s(region, func, obj_path, objdump)
        context = m2c_feed.build_context(region, module)
        dossier.m2c_skeleton = m2c_feed.run_m2c(func, s_text, context)
    except Exception as exc:  # noqa: BLE001 — m2c has many failure modes; the
        # dossier records the failure and proceeds context-less rather than
        # aborting the whole candidate (r7-6: the dossier is a comprehension
        # aid, losing one component shouldn't sink the candidate).
        dossier.m2c_error = f"{type(exc).__name__}: {exc}"

    return dossier


def _disasm_to_s(region: str, func: str, obj_path: str, objdump: str) -> str:
    """objdump -d -r the gap object and render it m2c-ready, via m2c_feed's
    own render() — the same path m2c_feed's CLI uses without --m2c."""
    result = subprocess.run(
        [objdump, "-d", "-r", "--architecture=armv5te", obj_path],
        capture_output=True, text=True, cwd=ROOT, check=True,
    )
    lines = result.stdout.splitlines()
    # Thumb detection is derived from the disassembly, not the symbol name.
    return m2c_feed.render(lines, func, thumb=_looks_thumb(result.stdout))


def _looks_thumb(objdump_text: str) -> bool:
    return bool(re.search(r"^\s+[0-9a-f]+:\s+[0-9a-f]{4}\s+\S", objdump_text, re.M)
                and not re.search(r"^\s+[0-9a-f]+:\s+[0-9a-f]{8}\s", objdump_text, re.M))


def enrich_with_coercion(dossier: Dossier, c_path: Path, region: str, func: str) -> Dossier:
    """Populate coercion_hits AFTER a compile attempt exists.

    suggest_coercion.py structurally cannot run before a compile: its
    entry point (`parse_objdiff_json` -> `suggest`) needs objdiff JSON
    diffing the CANDIDATE'S OWN compiled .o against the gap object
    (confirmed by reading suggest_coercion.py: `_find_object_files`
    globs `build/<region>/src/**/{symbol}.o`, i.e. an ALREADY-COMPILED
    object). The brief's step-1/step-2 framing lists it under "dossier"
    (step 1) — this implementation instead calls it once step 2's
    compile has produced the .o it needs, then folds the hits back into
    the same Dossier object before it's written out. The FINAL dossier a
    human/agent reads still has all four components; only the internal
    ordering differs from a literal step-1-before-step-2 reading, for a
    reason grounded in the tool's real constraints, not convenience.
    """
    objdiff_cli = suggest_coercion._find_objdiff_cli()
    if objdiff_cli is None:
        dossier.coercion_error = "objdiff-cli not found"
        return dossier
    try:
        found = suggest_coercion._find_object_files(func, region)
        if found is None:
            dossier.coercion_error = "no compiled .o found under build/<region>/"
            return dossier
        target_o, base_o = found
        data = suggest_coercion.run_objdiff(func, target_o, base_o, objdiff_cli)
        left, right, _match_pct = suggest_coercion.parse_objdiff_json(data)
        hits = suggest_coercion.suggest(left, right)
        dossier.coercion_hits = [
            {"wall_id": h.wall_id, "title": h.title, "confidence": h.confidence,
             "signature": h.signature, "recipe": h.recipe, "anchor": h.anchor,
             "notes": h.notes}
            for h in hits
        ]
    except Exception as exc:  # noqa: BLE001 — coercion hints are advisory;
        dossier.coercion_error = f"{type(exc).__name__}: {exc}"
    return dossier


# --------------------------------------------------------------------------- #
# Staging: place a candidate's source where ninja/fastmatch expect it
# --------------------------------------------------------------------------- #

def _reconfigure(region: str) -> None:
    subprocess.run(
        [sys.executable, "tools/configure.py", region],
        cwd=ROOT, capture_output=True, text=True, check=True,
    )


def stage_source(region: str, module: str, func: str, source_text: str, *,
                  reuse_existing: bool = False) -> tuple[Path, bool, str | None]:
    """Write `source_text` to the candidate's canonical src/ path.

    If `reuse_existing` and the path already holds real (presumably
    matched) source, it is left untouched and
    `previous_content=None, created=False` — the canary
    uses this so it never overwrites an already-shipped, git-tracked
    file. Otherwise the file is (over)written and configure.py is
    re-run if ninja didn't already know about this target (new file),
    per fastmatch.py's own documented requirement ("configure.py must
    be re-run whenever a new .c file is added to src/").

    Returns (path, created, previous_content). SAFETY: if the target
    path already held content (e.g. this run is re-attempting an
    ITERATE candidate whose prior draft is still on disk from an
    earlier `--keep-drafts` run, or a candidate was queued that
    shouldn't have been), that content is captured and returned so
    `unstage_source` can RESTORE it rather than just deleting the file
    — deleting would silently destroy whatever was there before this
    call, which is only ever safe when nothing was (an earlier,
    unconditional-delete version of this function had exactly this bug;
    caught by a test feeding a deliberately-wrong draft for an
    already-matched canary function and finding the real source
    unrestorable after cleanup).
    """
    path = src_path(region, module, func)
    if reuse_existing and path.is_file():
        return path, False, None
    previous_content = path.read_text() if path.is_file() else None
    was_new = previous_content is None
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(source_text)
    if was_new:
        _reconfigure(region)
    return path, True, previous_content


def unstage_source(path: Path, created: bool, previous_content: str | None, region: str) -> None:
    """Undo stage_source's write: restore `previous_content` if this call
    overwrote something, delete if it created a brand-new file, do
    nothing if stage_source never touched the path (reuse_existing)."""
    if not created:
        return
    if previous_content is not None:
        path.write_text(previous_content)
    elif path.is_file():
        path.unlink()
        _reconfigure(region)


# --------------------------------------------------------------------------- #
# Compile + fastmatch (step 2) and classification (step 3)
# --------------------------------------------------------------------------- #

def compile_and_fastmatch(c_path: Path, region: str, func: str) -> dict:
    """One serialized compile+fastmatch call. Thin wrapper over
    fastmatch.match_one so cmatch_loop's own logic stays independent of
    fastmatch's exact return shape."""
    result = fastmatch.match_one(c_path, region, func=func)
    if result["status"] != "ok":
        return {"status": result["status"], "match_percent": None,
                "detail": result.get("error", result["status"])}
    fn = next((f for f in result["functions"] if f["name"] == func), None)
    if fn is None:
        return {"status": "no_functions", "match_percent": None,
                "detail": f"{func} not found in compiled output"}
    return {"status": fn["status"], "match_percent": fn.get("match_percent"),
            "detail": fn.get("note", "")}


def classify(match_percent: float | None, fastmatch_status: str, attempts: int) -> str:
    """accept / iterate / park.

    100.0% (real word-for-word RESOLVED equality, fastmatch's default
    mode — Modes A/B included, not the wildcarded --unresolved path) is
    the ONLY accept condition; there is no partial-credit threshold.
    Anything else iterates until ATTEMPT_CAP (r7-10), then parks —
    covers a genuine low/partial match, a compile error, and the
    infra-error statuses ("no_functions", "not_in_gap") alike, since
    none of them are an accept and all are worth at most a bounded
    number of retries before giving up automatically.
    """
    if fastmatch_status == "ok" and match_percent is not None and match_percent >= 100.0:
        return "accept"
    return "iterate" if attempts < ATTEMPT_CAP else "park"


# --------------------------------------------------------------------------- #
# Persistence — the queue-state file
# --------------------------------------------------------------------------- #

def load_state(path: Path) -> dict:
    if not path.is_file():
        return {"version": 1, "candidates": {}}
    try:
        data = json.loads(path.read_text())
    except (OSError, json.JSONDecodeError):
        return {"version": 1, "candidates": {}}
    data.setdefault("version", 1)
    data.setdefault("candidates", {})
    return data


def save_state(path: Path, state: dict) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(state, indent=2) + "\n")


# --------------------------------------------------------------------------- #
# The loop itself
# --------------------------------------------------------------------------- #

def process_candidate(func: str, region: str, state: dict, *,
                       source_override: str | None = None,
                       keep_drafts: bool = False,
                       reuse_existing: bool = False,
                       fewshot_k: int = 3,
                       objdump: str = "arm-none-eabi-objdump") -> dict:
    """One full iteration for a single candidate: build the dossier,
    stage a source (source_override if given, else the dossier's m2c
    skeleton), compile+fastmatch it, classify, enrich the dossier with
    coercion hints if not accepted, update `state` in place. Returns the
    per-candidate result dict that also gets appended to the run report.
    """
    rec = state["candidates"].setdefault(func, {
        "region": region, "status": "pending", "attempts": 0, "history": [],
    })
    if rec["status"] in ("accepted", "parked"):
        return {"func": func, "region": region, "classification": rec["status"],
                "match_percent": rec.get("last_match_percent"),
                "skipped": True, "dossier": None}

    try:
        resolved = m2c_feed.resolve_symbol(region, func)
        module = resolved["module"]
    except Exception as exc:  # noqa: BLE001
        rec["attempts"] += 1
        rec["status"] = "iterate" if rec["attempts"] < ATTEMPT_CAP else "parked"
        rec["last_match_percent"] = None
        rec["history"].append({"attempt": rec["attempts"], "error": f"resolve_symbol: {exc}"})
        return {"func": func, "region": region, "classification": rec["status"],
                "match_percent": None, "detail": f"resolve_symbol failed: {exc}",
                "skipped": False, "dossier": None}

    dossier = build_dossier(region, func, module, k=fewshot_k, objdump=objdump)
    source_text = source_override if source_override is not None else dossier.m2c_skeleton
    if source_text is None:
        rec["attempts"] += 1
        rec["status"] = "iterate" if rec["attempts"] < ATTEMPT_CAP else "parked"
        rec["last_match_percent"] = None
        rec["history"].append({"attempt": rec["attempts"],
                                "error": f"no source to compile: {dossier.m2c_error}"})
        return {"func": func, "region": region, "classification": rec["status"],
                "match_percent": None, "detail": "dossier produced no compilable source",
                "skipped": False, "dossier": dossier}

    # Keep the dossier's raw m2c text available for the human, but compile a
    # mechanically scaffolded copy so placeholder types do not abort the
    # first fastmatch probe before it can produce useful feedback.
    if source_override is None:
        source_text = prepare_compile_source(source_text)
    c_path, created, previous_content = stage_source(
        region, module, func, source_text, reuse_existing=reuse_existing)
    try:
        outcome = compile_and_fastmatch(c_path, region, func)
    finally:
        if not keep_drafts:
            unstage_source(c_path, created, previous_content, region)

    rec["attempts"] += 1
    classification = classify(outcome["match_percent"], outcome["status"], rec["attempts"])
    rec["status"] = "accepted" if classification == "accept" else (
        "parked" if classification == "park" else "iterate")
    rec["last_match_percent"] = outcome["match_percent"]
    rec["history"].append({
        "attempt": rec["attempts"], "fastmatch_status": outcome["status"],
        "match_percent": outcome["match_percent"], "classification": classification,
        "detail": outcome["detail"],
    })

    if classification != "accept" and keep_drafts:
        # Only worth the extra compile if the draft is still on disk to
        # diff against (unstage already ran above when keep_drafts=False).
        dossier = enrich_with_coercion(dossier, c_path, region, func)

    return {"func": func, "region": region, "classification": classification,
            "match_percent": outcome["match_percent"], "detail": outcome["detail"],
            "skipped": False, "dossier": dossier}


def run_loop(func_names: list[str], region: str, *, state_path: Path,
             keep_drafts: bool = False, gate: bool = False, gate_dry_run: bool = True,
             source_overrides: dict[str, str] | None = None,
             reuse_existing: bool = False, fewshot_k: int = 3,
             objdump: str = "arm-none-eabi-objdump") -> dict:
    """Run the full pipeline over `func_names`, ONE compile+fastmatch at a
    time (serialized — no parallel wine calls). Step 4 (batch_sha1) only
    runs if `gate=True`; it is never automatic."""
    state = load_state(state_path)
    source_overrides = source_overrides or {}
    results = []
    for func in func_names:
        result = process_candidate(
            func, region, state,
            source_override=source_overrides.get(func),
            keep_drafts=keep_drafts, reuse_existing=reuse_existing,
            fewshot_k=fewshot_k, objdump=objdump,
        )
        results.append(result)
    save_state(state_path, state)

    accepts = [r["func"] for r in results if r["classification"] == "accept"
               or (r["skipped"] and r["classification"] == "accepted")]
    gate_report = None
    if gate and accepts:
        gate_report = invoke_batch_sha1(accepts, region, dry_run=gate_dry_run)

    return {"region": region, "results": results, "accepts": accepts,
            "gate_report": gate_report}


# --------------------------------------------------------------------------- #
# Step 4 — hand accepts to batch_sha1 (opt-in, never automatic)
# --------------------------------------------------------------------------- #

def invoke_batch_sha1(accepted_funcs: list[str], region: str, *, dry_run: bool = True) -> dict:
    """Hand accepted candidates to batch_sha1.py for the real gate.

    Only ever called when the caller explicitly asked for it (`--gate`);
    `run_loop`'s default is to never call this. batch_sha1.py itself
    never commits to git (confirmed by reading it) — dry_run additionally
    skips even the working-tree delinks.txt mutation + real `ninja sha1`,
    so a canary/demo run can prove the hand-off FORMAT is correct without
    any side effect at all.
    """
    c_paths = [str(src_path(region, m2c_feed.resolve_symbol(region, f)["module"], f)
                    .relative_to(ROOT))
               for f in accepted_funcs]
    cmd = [sys.executable, "tools/batch_sha1.py", region, *c_paths, "--json"]
    if dry_run:
        cmd.append("--dry-run")
    proc = subprocess.run(cmd, cwd=ROOT, capture_output=True, text=True)
    try:
        payload = json.loads(proc.stdout)
    except json.JSONDecodeError:
        payload = {"raw_stdout": proc.stdout, "raw_stderr": proc.stderr}
    payload["returncode"] = proc.returncode
    payload["dry_run"] = dry_run
    return payload


# --------------------------------------------------------------------------- #
# CANARY — temporarily reproduce a gap object for an already-matched
# function, so fastmatch has something to compare against, then restore.
# --------------------------------------------------------------------------- #

def delinks_path_for_module(region: str, module: str) -> Path:
    """The config/<region>/arm9/[overlays/<module>/]delinks.txt a module's
    TU headers live in — mirrors progress.py's `_discover_module_delinks`
    (main -> arm9/delinks.txt; ovNNN -> arm9/overlays/ovNNN/delinks.txt)."""
    arm9 = ROOT / "config" / region / "arm9"
    if module == "main":
        return arm9 / "delinks.txt"
    if module in ("itcm", "dtcm"):
        return arm9 / module / "delinks.txt"
    return arm9 / "overlays" / module / "delinks.txt"


class TemporaryGap:
    """Context manager: removes each given TU block from its OWN module's
    delinks.txt (main and every overlay have a SEPARATE delinks.txt — a
    mixed-module candidate set touches more than one file) so `ninja
    delink` regenerates real _dsd_gap@ objects for them, then restores
    every file's ORIGINAL content on exit (success or exception) and
    re-runs `ninja delink` again to put the tree back exactly as found.

    Empirically required, not guessed: fastmatch/m2c_feed's gap-object
    discovery both need a _dsd_gap@ object to exist, and dsd only
    synthesizes one for byte ranges NOT claimed by any TU header at all
    -- removing just the `complete` marker (leaving the TU header + its
    .text range) does NOT produce a gap object (verified: still not
    found after a `complete`-only removal + ninja delink). Removing the
    whole TU block does (verified: `_dsd_gap@main_201.o` appeared,
    fastmatch reported 100.0% against the function's own unmodified,
    already-shipped source). This is the ONLY way to canary-test
    fastmatch against a KNOWN match without inventing a fake one.
    """

    def __init__(self, headers_by_path: dict[Path, list[str]]):
        """headers_by_path: {delinks_path: [tu_header_relpath, ...]} —
        the exact `<relpath>:` header line (no trailing colon) each
        candidate's TU block starts with, grouped by which delinks.txt
        file it lives in."""
        self.headers_by_path = headers_by_path
        self._backups: dict[Path, str] = {}

    def __enter__(self) -> TemporaryGap:
        for path, headers in self.headers_by_path.items():
            backup = path.read_text()
            self._backups[path] = backup
            text = backup
            for header in headers:
                text = _strip_tu_block(text, header)
            path.write_text(text)
        _run_ninja_delink()
        return self

    def __exit__(self, exc_type, exc, tb) -> None:
        for path, backup in self._backups.items():
            path.write_text(backup)
        _run_ninja_delink()


def _strip_tu_block(text: str, header_relpath: str) -> str:
    """Remove the entire `<header_relpath>:\\n    ...\\n` TU block (header
    line through its last indented section line) from delinks.txt text.
    Raises ValueError if the header isn't found exactly once."""
    pattern = re.compile(
        rf"^{re.escape(header_relpath)}:\n(?:[ \t]+\S.*\n)*",
        re.MULTILINE,
    )
    matches = pattern.findall(text)
    if len(matches) != 1:
        raise ValueError(f"expected exactly 1 TU block for {header_relpath!r}, found {len(matches)}")
    return pattern.sub("", text, count=1)


def _run_ninja_delink() -> None:
    result = subprocess.run(["ninja", "delink"], cwd=ROOT, capture_output=True, text=True)
    if result.returncode != 0:
        raise RuntimeError(f"ninja delink failed:\n{result.stdout}\n{result.stderr}")


def run_canary(func_names: list[str], region: str, *, state_path: Path) -> dict:
    """Temporarily un-match `func_names`, run the full loop against their
    OWN real (unmodified) source as a source_override, confirm every one
    classifies 'accept' at 100.0%, then restore. Uses a throwaway state
    file path unless the caller overrides it, so a canary run never
    pollutes a real production queue's state. Candidates may span
    multiple modules (each with its own delinks.txt) in one call."""
    headers_by_path: dict[Path, list[str]] = {}
    source_overrides: dict[str, str] = {}

    for func in func_names:
        module = m2c_feed.resolve_symbol(region, func)["module"]
        c_path = src_path(region, module, func)
        rel = str(c_path.relative_to(ROOT))
        delinks_path = delinks_path_for_module(region, module)
        if not delinks_path.is_file():
            raise ValueError(f"{func}: no delinks.txt at {delinks_path}")
        text = delinks_path.read_text()
        if f"{rel}:\n" not in text:
            raise ValueError(f"{func}: no TU header {rel!r} found in {delinks_path} "
                              "-- is this really an already-matched .c-sourced function?")
        if not c_path.is_file():
            raise ValueError(f"{func}: {c_path} does not exist on disk")
        headers_by_path.setdefault(delinks_path, []).append(rel)
        source_overrides[func] = c_path.read_text()

    with TemporaryGap(headers_by_path):
        report = run_loop(
            func_names, region, state_path=state_path,
            keep_drafts=False, gate=False,
            source_overrides=source_overrides, reuse_existing=True,
        )
    return report


# --------------------------------------------------------------------------- #
# CLI
# --------------------------------------------------------------------------- #

def _print_report(report: dict) -> None:
    print(f"cmatch_loop — region {report['region']}")
    for r in report["results"]:
        tag = "SKIP" if r["skipped"] else r["classification"].upper()
        pct = f"{r['match_percent']:.2f}%" if r["match_percent"] is not None else "n/a"
        print(f"  [{tag:>9}] {r['func']:<24} match={pct:>8}  {r.get('detail', '')}")
    print(f"  accepts: {len(report['accepts'])} -> {report['accepts']}")
    if report.get("gate_report") is not None:
        gr = report["gate_report"]
        print(f"  batch_sha1 (dry_run={gr.get('dry_run')}): "
              f"{json.dumps(gr, indent=2)}")


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    ap.add_argument("--canary", action="store_true",
                     help="Canary mode: temporarily un-match the given "
                          "already-matched functions, prove fastmatch "
                          "reproduces their 100%% match, restore.")
    ap.add_argument("region", choices=["eur", "usa", "jpn"])
    ap.add_argument("funcs", nargs="*", help="Function names to process")
    ap.add_argument("--candidates-file", type=Path,
                     help="File with one function name per line, appended to funcs")
    ap.add_argument("--state", type=Path, default=DEFAULT_STATE_PATH,
                     help=f"Queue-state JSON path (default: {DEFAULT_STATE_PATH.relative_to(ROOT)})")
    ap.add_argument("--gate", action="store_true",
                     help="After the sweep, hand accepts to batch_sha1.py (opt-in; never automatic)")
    ap.add_argument("--gate-real", action="store_true",
                     help="With --gate, run batch_sha1.py for REAL (mutates delinks.txt, "
                          "runs a full ninja sha1). Without this, --gate uses --dry-run.")
    ap.add_argument("--keep-drafts", action="store_true",
                     help="Leave staged candidate .c files on disk instead of removing them")
    ap.add_argument("--json", action="store_true")
    args = ap.parse_args(argv)

    funcs = list(args.funcs)
    if args.candidates_file:
        funcs += [ln.strip() for ln in args.candidates_file.read_text().splitlines()
                  if ln.strip() and not ln.strip().startswith("#")]
    if not funcs:
        print("error: no candidate function names given", file=sys.stderr)
        return 2

    if args.canary:
        report = run_canary(funcs, args.region, state_path=args.state)
    else:
        report = run_loop(funcs, args.region, state_path=args.state,
                           keep_drafts=args.keep_drafts, gate=args.gate,
                           gate_dry_run=not args.gate_real)

    if args.json:
        print(json.dumps(report, default=lambda o: dataclasses.asdict(o) if dataclasses.is_dataclass(o) else str(o), indent=2))
    else:
        _print_report(report)

    if args.canary:
        ok = all(r["classification"] == "accept" for r in report["results"])
        return 0 if ok else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
