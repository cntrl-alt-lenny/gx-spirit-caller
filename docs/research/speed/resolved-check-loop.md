# The per-candidate resolved-check loop — drop into any HIGH/MED brief verbatim

**Status:** finalized 2026-07-01. Extracted from
[`ninja-report-panic.md`](ninja-report-panic.md)'s §2 into a standalone,
copy-paste, no-context-needed loop. If you're writing a campaign brief
and need "how do I check a candidate is resolved-clean on USA/JPN
without hitting the report panic," this is the whole answer — paste the
block below into the brief and go.

---

## Why this exists

Full-region `ninja report` on USA/JPN panics inside `objdiff-core`'s ARM
arch processor on a unit unrelated to whatever you're checking (briefs
499, 504, 508, 509, 510 all hit this — see `ninja-report-panic.md` §1 for
the diagnosis). This loop sidesteps it entirely: it reuses the
`*.o.resolved` sidecars that the existing three post-processors already
write to disk **before** the crash happens, and diffs just your one
candidate with `objdiff-cli diff` — a command that never touches the
other ~2000 units, so it cannot trip the panic no matter which unit is
the actual culprit.

---

## The loop

**Step 0 — prime the resolved sidecars (once per region-configure, or
after any batch of source edits):**

```bash
python tools/configure.py usa            # or jpn — EUR doesn't need this workaround
ninja objdiff

python tools/objdiff_filter_panic_units.py --in objdiff.json
python tools/objdiff_resolve_relocs.py     --in objdiff.json
python tools/patch_arm_mapping_symbols.py  --in objdiff.json
```

**Step 1 — let the aggregator crash, and ignore it:**

```bash
./objdiff-cli report generate -o build/usa/report.json || true
```

This is *expected* to fail on USA/JPN today. That's fine — by the time it
crashes, `objdiff.json` is already fully filtered + reloc-resolved +
mapping-patched on disk, and every surviving unit's `target_path` /
`base_path` already point at `*.o.resolved` sidecars that physically
exist, regardless of the crash. If this command *doesn't* panic, the
upstream bug is fixed (or this region doesn't hit it) — just use
`ninja report` normally and skip steps 2–4 below.

**Step 2 — look up your candidate's resolved `.o` pair:**

```bash
python - <<'PY'
import json
data = json.load(open("objdiff.json"))
needle = "func_020XXXXXX"          # <- your candidate's symbol name
for u in data["units"]:
    if needle in u.get("name", ""):
        print(u["name"])
        print("target:", u["target_path"])
        print("base:  ", u["base_path"])
PY
```

**Step 3 — diff just that pair:**

```bash
./objdiff-cli diff \
    -1 <target_path from step 2> \
    -2 <base_path from step 2> \
    func_020XXXXXX \
    --format json-pretty > /tmp/unit_diff.json
```

**Step 4 — read the verdict:**

```bash
python - <<'PY'
import json
d = json.load(open("/tmp/unit_diff.json"))
# Brief 507's gotcha: check per-instruction `diff_kind`, not a top-level
# `mismatches` array — there isn't one. Print the raw shape on your first
# run to confirm the exact field path before trusting a counter script.
print(json.dumps(d, indent=2)[:3000])
PY
```

A clean resolved match — pool words and BL/BLX targets both correct, not
just reloc-wildcarded — is what this loop confirms before you spend a
full `ninja sha1` (a full ROM rebuild) on the candidate. Treat it as the
step between "`verify.py`/raw objdiff says 100%" and "run `ninja sha1`,"
exactly where `ninja report` would normally sit if it didn't panic on
this region.

---

## Fallback — if step 1 doesn't crash for you, or `objdiff-cli diff` itself errors

1. **`ninja report` just works:** great, the upstream fix landed or this
   run got lucky (the panic is unit-dependent, not universal). Use it
   directly and skip this whole doc.
2. **Step 2 finds no matching unit name:** your candidate might not be
   in `objdiff.json` at all yet — run `ninja objdiff` again (step 0) to
   make sure the region was reconfigured *after* your source change
   landed, not before.
3. **`objdiff-cli diff` itself errors on the resolved sidecars:** the
   sidecars may be stale from a previous source state. Re-run step 0
   (the three post-processors are idempotent — safe to re-run any
   time) and retry.
4. **You need to know exactly which unit panics** (not just work around
   it): use the bisection script in `ninja-report-panic.md` §3 — it's a
   one-shot diagnostic, not part of the regular loop, so it isn't
   duplicated here.
5. **Still stuck:** fall back to the older manual workaround already in
   use across briefs 504/508/509/510 — a fresh single-unit `objdiff.json`
   run through the full post-processor chain *and* `report generate`
   (not just `diff`). Slower (still routes through the crashing
   aggregator, just on a smaller input) but it's the documented
   fallback-of-last-resort and has worked in every prior wave.

---

## One-block version (paste this directly into a brief)

```bash
# --- prime (once per region-configure) ---
python tools/configure.py usa && ninja objdiff
python tools/objdiff_filter_panic_units.py --in objdiff.json
python tools/objdiff_resolve_relocs.py     --in objdiff.json
python tools/patch_arm_mapping_symbols.py  --in objdiff.json
./objdiff-cli report generate -o build/usa/report.json || true   # expected to crash on USA/JPN; ignore

# --- per candidate ---
SYM="func_020XXXXXX"
read -r TGT BASE <<PY_OUT
$(python - <<PY
import json
d = json.load(open("objdiff.json"))
u = next(u for u in d["units"] if "$SYM" in u.get("name",""))
print(u["target_path"], u["base_path"])
PY
)
PY_OUT
./objdiff-cli diff -1 "$TGT" -2 "$BASE" "$SYM" --format json-pretty | python -c "
import json,sys
d = json.load(sys.stdin)
print(json.dumps(d, indent=2)[:3000])   # confirm diff_kind shape, then wire a real counter
"
```
