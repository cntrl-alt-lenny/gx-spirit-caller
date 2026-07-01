[//]: # (markdownlint-disable MD013 MD041)

# Brief 514 - HIGH sha1-failure forensics

**Branch:** `scaffolder/forensics-514`  
**Scope:** forensic retry of the first 12 `sha1-fail-despite-objdiff` parks from Brief 512.  
**Gate used here:** recreate one candidate at a time, `python tools/configure.py eur`, `ninja -j4 rom`, `ninja -j4 sha1`, capture byte diffs, then revert before the next candidate.

## Outcome

- Re-sampled **12 / 112** Brief 512 sha1-fail candidates.
- **0 unexpectedly matched** on retry.
- **12 / 12 rebuilt and failed EUR sha1 again**, so Brief 512 was not hiding a simple process bug for this sample.
- Every trial candidate was reverted before moving on; each post-revert clean EUR `ninja -j4 sha1` returned OK.
- Preserved the existing `build/brief512*` artifacts and `C:\Users\leona\Dev\gx-spirit-caller\_evidence-512\`.

The important finding: the failures are **not one mode**. They split into two buckets:

1. **Localized candidate-byte mismatches**: the uncompressed `arm9.bin` diff is tiny and entirely inside the candidate's original `.text` block. These are normal C-shaping/regalloc/operand-order misses that objdiff's fuzzy/per-unit path did not reject strongly enough.
2. **Link/layout avalanche mismatches**: the uncompressed `arm9.bin` diff starts before the candidate, often in `Entry.c` or early ARM9 text, and then fans out through hundreds of thousands of bytes. These are not pool-word/callee errors; they are section/layout/relocation perturbations from dropping in the C unit.

ROM byte diffs alone are noisy because ARM9 compression and header CRC/size fields amplify small uncompressed changes. The reliable diagnostic is: compare `build/eur/build/arm9.bin` against `extract/eur/arm9/arm9.bin`, then map offsets as `0x02000000 + offset`.

## Sample

Selected from `build/brief512-state.json` in the same order as the first Brief 512 `eur_parked` entries whose reason was `sha1-fail-despite-objdiff`:

`02001e5c`, `0200592c`, `02006524`, `02007f38`, `02007f58`, `0200a40c`, `0200a454`, `0200b0c8`, `0200b1bc`, `0200bff4`, `0200c23c`, `0200fbd4`

## Per-candidate dataset

`ROM runs` are raw offsets in `gx-spirit-caller_eur.nds` vs `orig/baserom_eur.nds`. `ARM9 runs` are uncompressed offsets in `build/eur/build/arm9.bin` vs `extract/eur/arm9/arm9.bin`, with virtual addresses shown for the first mapped run.

| Candidate | Candidate range | ROM diff | ARM9 diff | First mapped ARM9 run | Classification |
|---|---:|---:|---:|---|---|
| `02001e5c` | `0x02001e5c-0x02001e84` | 88,933,057 bytes / 2,589,324 runs | 604,225 bytes / 73,908 runs | `0x020008f8-0x020008f8`, owner `src/main/Entry.c` | **layout avalanche** before candidate |
| `0200592c` | `0x0200592c-0x020059b0` | 522,180 bytes / 10,301 runs | 12 bytes / 11 runs | `0x02005979-0x02005979`, owner candidate | **localized candidate mismatch** |
| `02006524` | `0x02006524-0x020065a8` | 93,984,095 bytes / 2,135,857 runs | 778,537 bytes / 109,341 runs; ARM9 grew by `0x20` | `0x020008f8-0x020008f8`, owner `src/main/Entry.c` | **layout avalanche + size growth** |
| `02007f38` | `0x02007f38-0x02007f58` | 1,656,974 bytes / 27,427 runs | 587,376 bytes / 72,876 runs | `0x020008f8-0x020008f8`, owner `src/main/Entry.c` | **layout avalanche** before candidate |
| `02007f58` | `0x02007f58-0x02007ff4` | 14 bytes / 6 runs | 11 bytes / 4 runs | `0x02007f75-0x02007f75`, owner candidate | **localized candidate mismatch** |
| `0200a40c` | `0x0200a40c-0x0200a454` | 514,917 bytes / 11,945 runs | 57 bytes / 8 runs | `0x0200a40c-0x0200a410`, owner candidate | **localized candidate mismatch** |
| `0200a454` | `0x0200a454-0x0200a488` | 509,709 bytes / 17,570 runs | 5 bytes / 4 runs | `0x0200a459-0x0200a459`, owner candidate | **localized candidate mismatch** |
| `0200b0c8` | `0x0200b0c8-0x0200b124` | 519,330 bytes / 11,409 runs | 61 bytes / 18 runs | `0x0200b0c8-0x0200b0c8`, owner candidate | **localized candidate mismatch** |
| `0200b1bc` | `0x0200b1bc-0x0200b208` | 522,395 bytes / 11,341 runs | 2 bytes / 2 runs | `0x0200b1ec-0x0200b1ec`, owner candidate | **localized candidate mismatch** |
| `0200bff4` | `0x0200bff4-0x0200c078` | 88,919,944 bytes / 2,593,515 runs | 570,904 bytes / 69,702 runs | `0x020008f8-0x020008f8`, owner `src/main/Entry.c` | **layout avalanche** before candidate |
| `0200c23c` | `0x0200c23c-0x0200c284` | 93,982,212 bytes / 2,136,395 runs | 759,628 bytes / 107,051 runs; ARM9 grew by `0x20` | `0x020008f8-0x020008f8`, owner `src/main/Entry.c` | **layout avalanche + size growth** |
| `0200fbd4` | `0x0200fbd4-0x0200fc78` | 93,648,523 bytes / 2,149,006 runs | 750,137 bytes / 107,161 runs; ARM9 grew by `0x20` | `0x020008f8-0x020008f8`, owner `src/main/Entry.c` | **layout avalanche + size growth** |

### First raw runs

These are the first raw runs captured by the forensic diff. Header/CRC offsets such as `0x2c` and `0x15e-0x15f` are expected secondary effects once the ARM9 payload changes.

| Candidate | First ROM runs | First ARM9 runs |
|---|---|---|
| `02001e5c` | `0x2c-0x2c`, `0x31-0x31`, `0x41-0x41`, `0x49-0x49`, `0x69-0x69`, `0x81-0x81`, `0x15e-0x15f`, `0x48f8-0x48f8`, `0x4900-0x4900`, `0x4b7c-0x4b7c` | `0x8f8-0x8f8`, `0x900-0x900`, `0xc38-0xc38`, `0xc3c-0xc3c`, `0xc94-0xc94`, `0xe58-0xe58`, `0xe78-0xe78`, `0xf5c-0xf5c`, `0xfd0-0xfd0`, `0x100c-0x100c` |
| `0200592c` | `0x2c-0x2c`, `0x15e-0x15f`, `0x4b7c-0x4b7c`, `0x800a-0x800f`, `0x8017-0x801b`, `0x8024-0x802a`, `0x8033-0x8033`, `0x8035-0x8038`, `0x8041-0x8042`, `0x8044-0x8046` | `0x5979-0x5979`, `0x597d-0x597d`, `0x5982-0x5982`, `0x5986-0x5986`, `0x598a-0x598a`, `0x598e-0x598e`, `0x5991-0x5992`, `0x5996-0x5996`, `0x599a-0x599a`, `0x599e-0x599e` |
| `02006524` | `0x2c-0x2d`, `0x31-0x31`, `0x41-0x42`, `0x49-0x49`, `0x51-0x51`, `0x69-0x6a`, `0x81-0x81`, `0x15e-0x15f`, `0x48f8-0x48f8`, `0x4900-0x4900` | `0x8f8-0x8f8`, `0x900-0x900`, `0xc3c-0xc3c`, `0xc94-0xc94`, `0xe78-0xe78`, `0xfd0-0xfd0`, `0x100c-0x100c`, `0x1028-0x1028`, `0x1030-0x1030`, `0x1038-0x1038` |
| `02007f38` | `0x2c-0x2d`, `0x51-0x51`, `0x15e-0x15f`, `0x48f8-0x48f8`, `0x4900-0x4900`, `0x4b7c-0x4b7d`, `0x4e78-0x4e78`, `0x4fd0-0x4fd0`, `0x500c-0x500c`, `0x5028-0x5028` | `0x8f8-0x8f8`, `0x900-0x900`, `0xe78-0xe78`, `0xfd0-0xfd0`, `0x100c-0x100c`, `0x1028-0x1028`, `0x1030-0x1030`, `0x1038-0x1038`, `0x1040-0x1040`, `0x1068-0x1068` |
| `02007f58` | `0xa785-0xa786`, `0xa881-0xa881`, `0xa884-0xa884`, `0xa889-0xa890`, `0xa892-0xa892`, `0xa895-0xa895` | `0x7f75-0x7f75`, `0x7f79-0x7f79`, `0x7f80-0x7f87`, `0x7f89-0x7f89` |
| `0200a40c` | `0x2c-0x2c`, `0x15e-0x15f`, `0x4b7c-0x4b7c`, `0x800b-0x800f`, `0x8018-0x801b`, `0x8026-0x802a`, `0x8035-0x8038`, `0x8043-0x8046`, `0x8051-0x8055`, `0x805f-0x8063` | `0xa40c-0xa410`, `0xa412-0xa416`, `0xa418-0xa41a`, `0xa41c-0xa41e`, `0xa420-0xa424`, `0xa426-0xa42a`, `0xa42c-0xa42e`, `0xa430-0xa44b` |
| `0200a454` | `0x2c-0x2c`, `0x15e-0x15f`, `0x4b7c-0x4b7c`, `0x8008-0x800f`, `0x8016-0x801b`, `0x8022-0x802a`, `0x8032-0x8033`, `0x8035-0x8038`, `0x8040-0x8042`, `0x8044-0x8046` | `0xa459-0xa459`, `0xa462-0xa462`, `0xa465-0xa466`, `0xa471-0xa471` |
| `0200b0c8` | `0x2c-0x2c`, `0x15e-0x15f`, `0x4b7c-0x4b7c`, `0x8007-0x800f`, `0x8014-0x801b`, `0x8021-0x802a`, `0x8030-0x8033`, `0x8035-0x8038`, `0x803e-0x8042`, `0x8044-0x8046` | `0xb0c8-0xb0c8`, `0xb0cd-0xb0cd`, `0xb0d0-0xb0d0`, `0xb0d2-0xb0d7`, `0xb0d9-0xb0db`, `0xb0dd-0xb0de`, `0xb0e0-0xb0e0`, `0xb0e2-0xb0e4`, `0xb0e6-0xb0e7`, `0xb0e9-0xb0ef` |
| `0200b1bc` | `0x8005-0x800f`, `0x8011-0x801b`, `0x801e-0x802a`, `0x802c-0x8033`, `0x8035-0x8038`, `0x803b-0x8042`, `0x8044-0x8046`, `0x8049-0x804b`, `0x804d-0x8055`, `0x8058-0x8063` | `0xb1ec-0xb1ec`, `0xb1ee-0xb1ee` |
| `0200bff4` | `0x2c-0x2c`, `0x31-0x31`, `0x41-0x41`, `0x49-0x49`, `0x69-0x69`, `0x81-0x81`, `0x15e-0x15f`, `0x48f8-0x48f8`, `0x4900-0x4900`, `0x4b7c-0x4b7c` | `0x8f8-0x8f8`, `0x900-0x900`, `0xe78-0xe78`, `0xfd0-0xfd0`, `0x100c-0x100c`, `0x1028-0x1028`, `0x1030-0x1030`, `0x1038-0x1038`, `0x1040-0x1040`, `0x1068-0x1068` |
| `0200c23c` | `0x2c-0x2d`, `0x31-0x31`, `0x41-0x42`, `0x49-0x49`, `0x51-0x51`, `0x69-0x6a`, `0x81-0x81`, `0x15e-0x15f`, `0x48f8-0x48f8`, `0x4900-0x4900` | `0x8f8-0x8f8`, `0x900-0x900`, `0xe78-0xe78`, `0xfd0-0xfd0`, `0x100c-0x100c`, `0x1028-0x1028`, `0x1030-0x1030`, `0x1038-0x1038`, `0x1040-0x1040`, `0x1068-0x1068` |
| `0200fbd4` | `0x2c-0x2d`, `0x31-0x31`, `0x41-0x42`, `0x49-0x49`, `0x51-0x51`, `0x69-0x6a`, `0x81-0x81`, `0x15e-0x15f`, `0x48f8-0x48f8`, `0x4900-0x4900` | `0x8f8-0x8f8`, `0x900-0x900`, `0xe78-0xe78`, `0xfd0-0xfd0`, `0x100c-0x100c`, `0x1028-0x1028`, `0x1030-0x1030`, `0x1038-0x1038`, `0x1040-0x1040`, `0x1068-0x1068` |

## Visible source/assembly clues

- `02001e5c`: `.s` is a 40-byte boolean accessor with explicit `mov r1,#0`, `movne r1,#1`, then `moveq/movne r0`. The draft C expresses this as `!(ptr && *(signed char *)ptr)`. That is a plausible semantic shape, but the C unit perturbs far more than the candidate block; this is a layout-avalanche case, not a direct pool/callee miss.
- `0200592c`: `.s` is a shutdown call sequence plus MMIO zero stores. The C draft names the same callees and MMIO constants, but the ARM9 diff is only 12 bytes inside `0x0200592c-0x020059b0`, consistent with store/call scheduling or register-choice mismatch.
- `02006524`: `.s` reloads `data_02103da4` around guarded indirect calls. The draft C already warns that binding the base would diverge. The retry grew uncompressed ARM9 by `0x20`, so this one fails before instruction-level tuning matters.
- `02007f38`: `.s` synthesizes `0x52008421` as `mov #0`, `orr #0x21`, `orr #0x8400`, `orr #0x52000000`. The draft C is a single constant store. Despite the function being only 32 bytes, the resulting ARM9 diff begins in early text; this is another link/layout perturbation, not just the expected constant-synthesis order issue.
- `02007f58`: ARM9 diff is 11 bytes, all inside the candidate. Treat this as an ordinary instruction-selection/register-allocation miss.
- `0200a40c`: ARM9 diff is 57 bytes, all inside the candidate. This is a normal C-shaping miss.
- `0200a454`: ARM9 diff is 5 bytes, all inside the candidate. This is likely one operand/order or condition-code detail.
- `0200b0c8`: ARM9 diff is 61 bytes, all inside the candidate. This is a normal C-shaping miss.
- `0200b1bc`: `.s` has the additive loop with `add r0, r5, r0`; the draft C even notes the commutative-add risk. Only two ARM9 bytes differ, both inside the candidate, so this is a very narrow operand/register encoding miss.
- `0200bff4`: `.s` uses manual slot scan and copy registers (`r5/r4/lr/ip` setup). The draft C uses structs and assignment-style copy. The ARM9 diff starts in early text and affects 570,904 bytes, so this draft is not a safe drop-in despite the old objdiff score.
- `0200c23c`: `.s` uses `ip` as the loop counter and `add r3, r0, ip, lsl #4`. The draft C mirrors the loop, but the build grows ARM9 by `0x20`; classify as layout/size failure first, then revisit the `ip`/addressing shape only after size containment is solved.
- `0200fbd4`: `.s` has two linked-list paths from `data_0218cbc8 + 0x1000`; the C draft is semantically close, but ARM9 grows by `0x20` and the first diffs are early text. This is another layout/size failure, not a bad literal/callee value.

## Failure-mode classification

| Bucket | Count | Members | Meaning |
|---|---:|---|---|
| Localized candidate-byte mismatch | 6 | `0200592c`, `02007f58`, `0200a40c`, `0200a454`, `0200b0c8`, `0200b1bc` | Correct pool/callee values are not enough; these need instruction-level C reshaping. The sha1 failure is real but contained. |
| Link/layout avalanche | 3 | `02001e5c`, `02007f38`, `0200bff4` | ARM9 size stayed the same, but many earlier bytes changed. The C unit perturbed link/layout/relocation output outside the candidate. |
| Link/layout avalanche + ARM9 size growth | 3 | `02006524`, `0200c23c`, `0200fbd4` | The C unit grew the uncompressed ARM9 image by `0x20`; downstream/address-sensitive output avalanched. |

## Verdict

**FIXABLE, but not by the Brief 512 ground-truth lever alone.**

The dossiers did their job for pool words and BL targets, but this sample proves there are two additional gates needed before accepting or even spending much time on old HIGH candidates:

1. Add a cheap **uncompressed ARM9 containment pre-gate** after `ninja rom`: compare `build/eur/build/arm9.bin` to `extract/eur/arm9/arm9.bin`. If the diff is not wholly inside the candidate's original delinked range, park as `layout-avalanche` immediately.
2. For contained candidates, drive the fix with **byte-level instruction diffs**, not raw objdiff percentage. The local failures here are small enough that C-shaping recipes can target exact operand order, declaration/register allocation, condition-code lowering, and store/call order.

For future HIGH waves, do not treat per-unit objdiff or resolved pool/callee equality as sufficient scouting. The real scouting predicate should be:

```text
candidate is worth iteration =
  (uncompressed ARM9 diff is contained in candidate range)
  and (candidate/object size did not perturb linked layout)
```

Then the final acceptance gate remains regional `ninja sha1`.

## Verification

- Each candidate trial used `ninja -j4 rom` and `ninja -j4 sha1`; no bare `ninja` was used.
- The first long forensic command timed out while clean-gating candidate 3. The tree was clean; I reran a clean EUR sha1, compacted the temporary 514 JSON ledger, and reran the first three samples so the final dataset has uniform run counts.
- Final clean EUR sha1 after all candidates were reverted:

```text
gx-spirit-caller_eur.nds: OK
```
