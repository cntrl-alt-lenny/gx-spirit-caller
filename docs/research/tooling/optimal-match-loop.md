# Optimal per-candidate match loop

**Audience:** campaign briefs, Codex decomper agents, anyone writing a new wave instruction.
**Status:** build-free analysis, 2026-06-29.

---

## The problem with bare `ninja`

The CLAUDE.md workflow section shows:

```
edit src/foo.c → ninja → ninja objdiff → (open diff) → iterate
```

`ninja` is incremental — it only recompiles the changed `.c` file — but it always chains through:

1. **Link** (`mwldarm` + `patch_ov004_veneers.py` + `patch_module_literals.py`) — ARM9 full link, produces `build/eur/arm9.o`
2. **ROM config** (`dsd rom config` + `patch_ov004_veneers.py` again) — produces `build/eur/build/rom_config.yaml`
3. **Junk cleanup** (`clean_macos_junk.py` stamp) — reads `extract/eur/files/`
4. **ROM build** (`dsd rom build` + `patch_rom_header_crc.py`) — produces `gx-spirit-caller_eur.nds`

Each of steps 1–4 is disk-bound; on a campaign machine with >3,000 unmatched candidates this chain runs on *every reshape attempt*. `ninja sha1` adds a fifth step (SHA-1 hash of the ROM), but that is the *only* step that provides the byte-identity guarantee.

**The waste:** if the decomper makes an average of 5 reshape attempts per candidate before landing a match, and only 1 of those needs the full chain, then 4 out of 5 full chains per candidate are pure overhead.

---

## Cost model

| Phase | What runs | Approx time | Needed for |
|-------|-----------|-------------|------------|
| Compile one TU | `mwccarm.exe` → `.o` | ~0.5–2 s | every attempt |
| Objdump compare | `arm-none-eabi-objdump` × 2 + word compare | ~0.5 s | every attempt |
| Full Ninja link | `mwldarm` + two patchers | ~5–15 s | per accept only |
| ROM build | `dsd rom build` + CRC patcher | ~5–10 s | per accept only |
| SHA-1 hash | `tools/sha1.py` | ~0.1 s | per accept (gate) |

For a wave of 50 candidates with 5 attempts each:

- **Naive (bare ninja per attempt):**
  250 attempts × ~22 s full chain + 50 accepts × ~22 s = **6,600 s ≈ 110 min** link/ROM time wasted
- **Optimal (verify.py per attempt, sha1 per batch):**
  250 attempts × ~2.5 s + 1 batch sha1 × ~22 s = **647 s ≈ 11 min**
- **Saving: ~100 min per 50-candidate wave; ~10.2× faster inner loop.**

The saving scales directly with the reject rate: if average attempts-per-match is A and accept rate is P, then full-ninja calls avoided ≈ N_wave × A × (1 − 1/A) ≈ N_wave × (A − 1).

---

## Recommended loop

### Per-attempt gate: `tools/verify.py`

```bash
# Compile one TU and compare against its gap object — no Ninja, no link, no ROM.
# Runs in ~2–3 s on Windows (mwccarm.exe native, no wine runner needed).

python tools/verify.py src/overlay002/func_ov002_021b0a30.c \
    func_ov002_021b0a30

# With the multi-tier flag (try default + legacy + sp3 — useful for main):
python tools/verify.py src/main/func_0201f0f4.c \
    func_0201f0f4 --cc all --module main
```

`verify.py` returns 0 on OBJDIFF 100%, non-zero on DIFF or WALL. It handles:
- `.L_*` internal continuation labels (the gap-object split — the `.L_ span fix`)
- Const-pool tail stripping
- Reloc-word wildcarding
- Three compiler tiers via `--cc all`

When verify.py says "OBJDIFF 100% (2.0, 42 insns)", the match is confirmed at the TU level. Proceed to the batch-accept step.

### Batch collect: accumulate accepts before sha1

Do NOT run `ninja sha1` after each accepted match. Accumulate accepts into a small batch (5–10 functions), then run sha1 once for the batch:

```bash
# After writing all accepted .c files:
ninja sha1
```

One `ninja sha1` per batch pays the link+ROM cost once across N confirms. The link is incremental — only the changed TUs recompile — so the link time for a batch of N is only marginally more than for one.

### Full loop (copy-pasteable for campaign briefs)

```bash
# ── INNER LOOP (per reshape attempt) ──────────────────────────────────────
# 1. Write / edit the .c file.
# 2. Quick per-TU gate:
python tools/verify.py <src_path> <func_name> [--cc all] [--module overlay002]
#    EXIT 0 → OBJDIFF 100% → add to accept batch and move to next candidate.
#    EXIT 1 → DIFF → iterate on the reshape (go back to step 1).
#    EXIT 2 → NOT-IN-GAP → func already matched/absent, skip.

# ── BATCH ACCEPT (every 5–10 confirmed matches) ────────────────────────────
# 3. All accepted .c files already written at their final src/ path.
# 4. One sha1 gate for the whole batch:
ninja sha1
#    PASS (sha1.py prints "OK") → commit the batch and move to next.
#    FAIL → one of the accepted matches broke a sibling; bisect with:
#      ninja objdiff && ninja report   # regenerate diff DB
#      python tools/progress.py        # see which unit regressed

# ── USA/JPN PORT BATCH (after EUR batch is confirmed) ──────────────────────
# 5. Port all accepted EUR .c files:
python tools/port_to_region.py <addr_list> --region usa
python tools/port_to_region.py <addr_list> --region jpn
# 6. One sha1 gate covering all three regions:
ninja sha1   # (configure.py already set to eur; run usa/jpn separately)
```

### Anti-patterns to avoid

| Anti-pattern | Why it wastes time |
|-------------|-------------------|
| `ninja` on every attempt | Chains full link + ROM build even when you just want to see if the bytes match |
| `ninja objdiff` on every attempt | `dsd objdiff` reads all delinked `.o` files and regenerates the full `objdiff.json`; slow for a single-function check |
| Bare `ninja` (no target) | Pulls the `m2ctx` target on non-decomp runs; worse, on Windows it also tries to build the context files for every TU (the `m2ctx` phony fails silently but wastes time) |
| `ninja sha1` after each single accept | Pays full link+ROM cost per match instead of per batch |
| `ninja rom` instead of `ninja sha1` | Builds the ROM but skips the hash check — leaves you uncertain whether bytes are truly identical |

---

## Notes for the decomper

- `tools/fastmatch.py` (Decomper-owned) provides the same per-TU compile+compare pipeline as `verify.py` in the campaign's fast inner loop. Use it when it is available in the active worktree.
- `verify.py` is the fallback when `fastmatch.py` is not wired in — the core logic is identical (`parse_words` + `compare_words` + `.L_` span fix).
- On Windows the `wine` runner is not needed — `mwccarm.exe` runs natively. `verify.py` detects the platform via `get_platform.py`.
- **Never run `ninja` concurrently from two agents in the same worktree.** Ninja's build graph writes to shared output paths (`build/eur/arm9.o`, the ROM file). `verify.py` is safe to run concurrently (writes to `/tmp/_verify_<func>.o` — unique per function name).
- `ninja sha1` must be serialized if two agents share a worktree. Use a file lock or run it from one agent only, after the other has written all its accepted `.c` files.
