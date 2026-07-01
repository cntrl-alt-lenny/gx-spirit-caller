# The `ninja report` panic on USA/JPN — root cause + a fast per-unit workaround

**Status:** build-free analysis, 2026-07-01. Companion to
[`docs/research/objdiff-sha1-gap/gap-taxonomy.md`](../objdiff-sha1-gap/gap-taxonomy.md)
and [`docs/research/objdiff-arm-crash-workaround.md`](../objdiff-arm-crash-workaround.md).

**Symptom (both campaign agents hit it — briefs 499, 504, 508, 509, 510):**
full-region `ninja report` on USA/JPN panics inside `objdiff-core`'s ARM
arch processor on a unit unrelated to the candidate being verified. Every
recent HIGH/MED wave brief describes the same manual workaround: fall back
to an "isolated single-unit `objdiff-cli report generate`" per port,
instead of trusting the aggregate regional report. That workaround is
real but ad hoc — this doc turns it into an exact, fast, scriptable
recipe, and gives the brain a way to actually pin down the failing unit.

---

## 1. Why this still happens after three existing fixes

The `objdiff_report` ninja rule (wired in `tools/configure.py`) already
chains three post-processors before `objdiff-cli report generate`:

```text
tools/objdiff_filter_panic_units.py   (brief 187) — drops code-less / missing-.o units
tools/objdiff_resolve_relocs.py       (brief 206) — resolves pool/BL relocs, writes *.o.resolved
tools/patch_arm_mapping_symbols.py    (brief 210/212) — fixes $d/$a mapping-symbol mismatches
```

All three are individually well-diagnosed and were validated against EUR:
[`docs/research/objdiff-arm-crash-workaround.md`](../objdiff-arm-crash-workaround.md)
reports EUR going from panicking to a clean `report.json` in ~0.2s after
the brief-187 filter alone (3330 → 2234 units, 1096 dropped).

But brief 499 and every HIGH wave since (504, 508, 509, 510) report the
**full USA/JPN report still panics** at the same signature —
`objdiff-core/src/arch/arm.rs:130:29`, `index out of bounds: the len is 0
but the index is 18446744073709551615` — even with all three
post-processors applied. That means there is a **fourth, uncovered unit
shape** that only shows up in the USA/JPN build, not in EUR.

### The most likely gap (grounded in the patcher's own documented limits)

`patch_arm_mapping_symbols.py`'s docstring documents its own escape hatch:

```text
Mass-rename fallback: no existing $a in strtab. Only safe if
ALL $d ranges are entirely-ARM ... Partial-arm ranges also
disqualify mass-rename: we can't split without an $a slot to
point at.
```

and in code:

```python
if not all_promotable:
    info["d_left_as_data"] = info["d_seen"]
    return bytes(out), info      # <- silent no-op, file left untouched
```

So a `.o` whose `.text` has **zero native `$a` symbols** (nothing was
ever a real ARM mnemonic — plausible for small ported `.s` bodies, or the
brief-192 hand-encoded cross-overlay-BL recipe applied inside a USA/JPN
port) **and** whose `$d` ranges are a *mix* of all-data and all-ARM (not
uniformly one or the other) is silently skipped by the mapping-symbol
patcher. Its original mwasmarm-emitted mapping-symbol layout — the exact
shape that the brief-187/210 diagnosis samples (drawn from EUR) may never
have contained — reaches `objdiff-cli report generate` unmodified. Given
the *documented* panic family is explicitly about mapping-symbol
name/type inconsistency (brief 210's own comment: "otherwise objdiff's
reader sees a `$a`-named symbol with STT_OBJECT type and trips ...
`arm.rs:130` — same panic family brief 187 documented for code-less
ELFs, different root cause"), an unfixed mixed-`$d`-no-`$a` unit is the
best-supported candidate for the residual USA/JPN-only trigger.

**This is a hypothesis, not a confirmed diagnosis** — I cannot run
builds from this lane. Section 3 gives the brain an exact bisection
script to confirm or refute it in one run.

### Why EUR doesn't show this and USA/JPN does

EUR's `.s` corpus is mostly `dsd`-delinked (native ARM mnemonics → native
`$a` symbols already present) or hand-written per the brief-192/209/210
corpus that the existing patcher was diagnosed against. USA/JPN's `.s`
corpus additionally includes **mechanically ported** bodies
(`tools/port_to_region.py`, brief 064) and small routing-tier stubs whose
mapping-symbol shape was never part of the original sample. A unit shape
that never occurred in the diagnosis sample is exactly the kind of thing
a heuristic, sample-driven fix (brief 210's "if all $d are all-arm,
mass-rename; otherwise skip") will miss.

---

## 2. The reliable per-unit resolved-check recipe

**Key insight:** the `objdiff_report` rule is one shell chain —
`filter && resolve && patch && report generate`. When the *last* command
(`report generate`) panics, the first three have **already completed and
written their output to disk**: `objdiff.json` is fully filtered,
reloc-resolved, and mapping-patched, and every surviving unit's
`target_path` / `base_path` already point at `*.o.resolved` sidecars that
physically exist. The panic only happens inside the whole-project
*aggregation* step. `objdiff-cli` also has a **single-pair `diff`
subcommand** (already used ad hoc in briefs 307 and 507:
`objdiff-cli diff -1 <mine.o> -2 <delinked.o> <sym> --format
json-pretty`) that never touches the other 2000+ units at all — so it
cannot trip the panic, no matter which unit is the culprit.

Combine the two: run the chain once, let step 4 crash (harmless, ignore
the exit code), then hit the already-resolved sidecars directly with
`diff` for just the candidate you care about.

```bash
# --- one-time per region-configure (or after any batch of source changes) ---
python tools/configure.py usa            # or jpn
ninja objdiff                            # normal incremental dsd objdiff step

python tools/objdiff_filter_panic_units.py --in objdiff.json
python tools/objdiff_resolve_relocs.py     --in objdiff.json
python tools/patch_arm_mapping_symbols.py  --in objdiff.json
# objdiff.json is now fully resolved + mapping-patched on disk, and every
# surviving unit's *.o.resolved sidecar already exists, REGARDLESS of
# whether the next command panics.

./objdiff-cli report generate -o build/usa/report.json || true
# ^ expected to panic on USA/JPN today — that's fine, ignore it. If it
#   DOESN'T panic, the bug's already fixed upstream or by a later patch;
#   just use `ninja report` normally and skip the rest of this recipe.

# --- per-candidate, as many times as needed, no panic exposure ---
python - <<'PY'
import json
data = json.load(open("objdiff.json"))
needle = "func_020XXXXXX"          # <- the candidate's symbol name
for u in data["units"]:
    if needle in u.get("name", ""):
        print(u["name"])
        print("target:", u["target_path"])
        print("base:  ", u["base_path"])
PY

./objdiff-cli diff \
    -1 <target_path from above> \
    -2 <base_path from above> \
    func_020XXXXXX \
    --format json-pretty > /tmp/unit_diff.json

python - <<'PY'
import json
d = json.load(open("/tmp/unit_diff.json"))
# Brief 507's gotcha: check per-instruction `diff_kind`, not a top-level
# `mismatches` array (there isn't one). Print the raw shape on the first
# run to confirm the exact field path before wiring a counter — this
# tool's JSON schema hasn't been captured in any doc yet.
print(json.dumps(d, indent=2)[:3000])
PY
```

This is the *exact same data* `ninja report` would have shown you for
that unit — pool words and BL targets resolved, not reloc-wildcarded —
at the cost of one `diff` call (order milliseconds, project-size-
independent) instead of one full-project aggregation (which currently
doesn't even complete on USA/JPN).

### Why this beats the current manual workaround

The workaround already in use ("isolated single-unit `objdiff-cli
report generate`", per briefs 504/508/509/510) rebuilds a **fresh
one-unit `objdiff.json`** and reruns the **full report-generate
aggregator** on it every time — still going through the code path that
panics, just with a smaller (hopefully panic-free) input. It's ad hoc:
each wave re-derives which unit to isolate, and it still risks hitting
the panic if the isolated unit happens to be near a boundary case. The
`diff`-on-resolved-sidecars recipe above never calls the aggregator at
all for the per-candidate case — it only needs the aggregator to run
**once** (and tolerates its crash) to prime the sidecars.

---

## 3. A test for the brain — bisect the exact panicking unit(s)

I cannot run this (no builds from this lane), but it is copy-paste-ready
and mirrors the exact method brief 187 itself used to diagnose the
original EUR crash ("used a per-unit binary search against
`objdiff.json`"):

```python
#!/usr/bin/env python3
"""bisect_report_panic.py — find the unit(s) in an already-filtered/
resolved/mapping-patched objdiff.json that still crash
`objdiff-cli report generate`. Run AFTER the normal 3-step chain so
you're bisecting the RESIDUAL panic, not rediscovering the brief-187/210
cases those steps already fix.

Usage: python bisect_report_panic.py [--in objdiff.json] [--objdiff-cli PATH]
"""
import argparse, json, subprocess, sys, tempfile, os

def panics(objdiff_cli, base_data, units, timeout=60):
    data = dict(base_data)
    data["units"] = units
    with tempfile.NamedTemporaryFile("w", suffix=".json", delete=False) as tmp:
        json.dump(data, tmp)
        tmp_path = tmp.name
    out_path = tmp_path + ".report.json"
    try:
        r = subprocess.run(
            [objdiff_cli, "report", "generate", "-o", out_path],
            capture_output=True, timeout=timeout,
        )
        return r.returncode != 0 or b"panicked" in r.stderr
    except subprocess.TimeoutExpired:
        return True   # hang counts as a failure worth isolating too
    finally:
        os.unlink(tmp_path)
        if os.path.exists(out_path):
            os.unlink(out_path)

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--in", dest="in_path", default="objdiff.json")
    ap.add_argument("--objdiff-cli", default="./objdiff-cli")
    args = ap.parse_args()

    with open(args.in_path) as f:
        base_data = json.load(f)
    all_units = base_data["units"]

    if not panics(args.objdiff_cli, base_data, all_units):
        print("Full set does NOT panic on this input — nothing to bisect. "
              "(Maybe the 3-step chain already fixed it for this region?)")
        sys.exit(0)

    work = list(all_units)
    culprits = []
    while len(work) > 1:
        mid = len(work) // 2
        left, right = work[:mid], work[mid:]
        if panics(args.objdiff_cli, base_data, left):
            print(f"  narrowing: {len(work)} -> {len(left)} (left half panics)")
            work = left
        elif panics(args.objdiff_cli, base_data, right):
            print(f"  narrowing: {len(work)} -> {len(right)} (right half panics)")
            work = right
        else:
            # Neither half alone panics -> interaction between units, or
            # the panic needs >1 unit present. Fall back to a linear scan
            # pairing each unit in `work` with a small fixed anchor set.
            print(f"  split lost the panic at {len(work)} units — "
                  f"linear-scanning for single-unit culprits")
            for u in work:
                if panics(args.objdiff_cli, base_data, [u]):
                    culprits.append(u)
            work = []
            break

    result = culprits or work
    print(f"\n=== {len(result)} culprit unit(s) ===")
    for u in result:
        print(json.dumps({
            "name": u.get("name"),
            "target_path": u.get("target_path"),
            "base_path": u.get("base_path"),
            "metadata": u.get("metadata"),
        }, indent=2))

if __name__ == "__main__":
    main()
```

**What to do with the result:** once the brain has the culprit unit's
`target_path`, inspect its mapping symbols directly with the existing
sweep tool (already in `tools/`, no new code needed):

```bash
python tools/patch_arm_mapping_symbols.py --in objdiff.json --sweep --sweep-only-changed -v
```

If the culprit shows `pre_a_count=0` with mixed `$d` promotability (some
rows promotable, some not — visible in the `info` dict this prints),
that confirms the Section 1 hypothesis. If not, the sweep output plus
the culprit's raw `.o` (dump with `arm-none-eabi-objdump -d -r -t`) is
enough evidence to file a tighter upstream report than brief 187's, the
same way brief 210 extended brief 187's original fix.

---

## 4. Payoff

Every recent HIGH/MED wave brief (499, 504, 508, 509, 510) spends a
paragraph re-deriving essentially this same workaround from scratch, and
each port group currently pays for a **fresh single-unit
`report generate`** (full aggregator invocation, still going through the
crashing code path) instead of a **`diff` call against already-resolved
sidecars** (no aggregator, no panic exposure, no risk of the isolated
unit itself being a boundary case). Adopting the Section 2 recipe as the
standard USA/JPN verification step removes an entire category of
per-wave friction and makes the "did this port actually resolve
correctly" check as cheap on USA/JPN as it already is on EUR. Section 3's
bisection turns "panics on an unrelated unit" (currently just accepted
as background noise) into an actual bug report, which is the only way
this gets fixed for good rather than worked around forever.
