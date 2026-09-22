### decomper/ov004-rodata-cluster-wave

**Goal:** Run the first ov004 `.rodata` cluster wave — now-
unlocked by brief 142's patcher generalisation. Brief 141 ran
ov004's `.data` cluster work (31 syms across C / D-1 / D-2)
but skipped `.rodata` because adding `.rodata` claims dropped
mwldarm's veneer count from 86 → 9, breaking brief 134's
hard-coded `EXPECTED_VENEER_COUNT=86` assertion. Brief 142
fixed the patcher to accept any count `n ∈ [0, 86]`.

**Context — what brief 141 + 142 documented:**

Brief 141's PR explicitly flagged this as the next-blocked
work:

> Outcome: All Part 1-3 claims restricted to ov004's `.data`
> section. Part 4 (Pattern 3 on `.rodata`) skipped — requires
> patcher to be tolerant of variable veneer counts (brief 142+
> candidate).

Brief 142's PR confirmed the unlock:

> Per the brief: ov004 `.rodata` cluster work unlocked
> (decomper can now claim `.rodata` symbols without breaking
> the patcher); W7 mitigation becomes general.

Brief 141 surfaced a useful empirical: 2 `.rodata` claims
suppressed 77 of 86 veneers (86 → 9). At full ov004 `.rodata`
coverage the veneer count may drop to 0 — the patcher is now
tolerant of that endpoint.

**Brief 145 deliverables:**

### Part 1 — Cluster C Pattern 1 on ov004 `.rodata`

Native `.rodata` integer arrays + Pattern 1 strings. Recipe per
brief 122 / 126:

```asm
        .rodata
        .global data_ov004_<addr>
data_ov004_<addr>:
        .word ...   # or .ascii / .asciz
```

Enumerate via:

```bash
arm-none-eabi-objdump -t build/eur/.../arm9_ov004.bin \
    | grep '\.rodata' | sort -k1
```

Target: 15-30 chunks.

### Part 2 — Cluster C Pattern 3 chunks on ov004 `.rodata`

Use the generator (brief 125; depending on brief 144 status,
manually add `.extern` declarations if 144 hasn't landed yet,
or rely on the fixed generator if 144 has).

```bash
python tools/cluster_c_pattern3_gen.py --version eur \
    --module ov004 --start 0x<chunk_start> \
    --end 0x<chunk_end>
```

Target: 3-8 chunks.

### Part 3 — Cluster D candidates in ov004 `.rodata` (if any)

If ov004's `.rodata` has D-1 (dispatch tables) or D-2 (scalar
arrays) candidates that weren't in the `.data` section, claim
those too. Brief 141 found D-1 + D-2 in `.data` were small
pools (2 + 4 = 6); the `.rodata` analog may be larger or
smaller depending on game architecture.

**Combined target: ≥ 20 ov004 `.rodata` symbols.** Self-extend
optional.

**Critical verify (3-region SHA1 must hold):**

1. After each cluster part, run:

   ```bash
   for v in eur usa jpn; do
       python tools/configure.py "$v" && ninja sha1
   done
   ```

2. Watch the patcher output. With each new `.rodata` claim,
   veneer count drops. The patcher's "veneers spliced: N"
   line should reflect the current state.

3. If `ninja sha1` regresses at any point, bisect the latest
   batch of claims to identify the offending symbol.

**Method:**

1. Read brief 141's PR for the `.data` cluster recipe (same
   shape applies to `.rodata`).
2. Read brief 142's PR to confirm the patcher invariant
   (`expected_output_delta_for(n) = n × 12 - 8`, or 0 for
   `n=0`).
3. Enumerate ov004 `.rodata` gap symbols via objdump on the
   `_dsd_gap@ov004_*.o` file.
4. Apply Part 1 first (fast, low-risk Pattern 1 chunks).
5. Then Part 2 (Pattern 3 chunks via generator).
6. Then Part 3 if any D candidates.
7. Verify 3-region SHA1 after each part.

**Non-scope:**

- ❌ Cloud brief 144 work (Pattern 3 generator extern fix —
  separate cloud track).
- ❌ Cluster B pointer sub-pool, cross-region cluster A apply,
  30 KB main mega-array.
- ❌ AGENTS.md / state.md edits beyond the wave PR.

**Success:**

- ≥ 20 ov004 `.rodata` symbols claimed.
- All 3 regions stay at 27/27 module baseline.
- **3-region `ninja sha1` PASS preserved.**
- ov004 module-checksum stays OK across all 3 regions
  (most important — verify W7 binary patcher unaffected,
  now tolerant of new veneer count).
- Per-wave PR with cluster breakdown + observed veneer count
  in funnel.

**Branch:** `decomper/ov004-rodata-cluster-wave`

**Priority:** HIGH. First production use of brief 142's
generalised patcher; demonstrates the W7 mitigation is fully
general.

**After this brief lands:**

1. **ov004 cluster work substantially complete.** Combined
   with brief 141's `.data` work (31 syms), ov004 cluster
   coverage should reach decent depth.
2. **W7 mitigation generality validated end-to-end.** The
   patcher tolerates the source-coverage shift; brief 132's
   "mwldarm uses VA + MEMORY region only" model is now fully
   exercised.
3. **Decomp-tier funnel narrows further.** Remaining pools:
   cluster B residue (size-1/2 + zero-value + non-aligned),
   cluster B pointers (typedef research), cross-region applies,
   30 KB mega-array.
