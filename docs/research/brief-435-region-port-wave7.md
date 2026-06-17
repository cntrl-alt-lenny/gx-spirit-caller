[//]: # (markdownlint-disable MD013 MD041)

# Brief 435 — region port, wave 7 — USA standing + a MEDIUM-floor error caught

**Brief:** 435 (decomper). Wave 7 of the USA/JPN region-port lane (briefs 421
scout, 423–433). The brain asked for a read on USA's remaining clean-port count
and whether the MEDIUM tier is a grind worth pushing. Mechanism: see
[`brief-423-region-port-scale.md`](brief-423-region-port-scale.md).

## Result

- **39 USA `.c` ports (MEDIUM floor) + 40 JPN (HIGH)** (79 this wave), gated
  **byte-identical**. (USA started at 40; 1 dropped — a MEDIUM mis-resolution
  caught by the gate, below.)
- **3-region `ninja sha1`: EUR / USA / JPN all `OK`**.

## USA standing (the brain's question)

After this wave USA `main` `.c` is **almost drained**:

| Region | Lane total | Portable-unported remaining | Breakdown |
|--------|-----------:|----------------------------:|-----------|
| USA | 323 | ~67 | **~19 clean MEDIUM-reachable (~½ wave)** + 47 SDK-blocked + 1 known-bad |
| JPN | 244 | ~148 | ~101 reachable (~2-3 waves) + 47 SDK-blocked |

**Verdict on the USA MEDIUM tier: it is NOT a grind — it's clean and fast**
(69/70 ports across waves 6-7 were byte-identical first try). But the USA `main`
runway is nearly gone: **~19 clean MEDIUM ports left (about half a wave)**, after
which only the 47 SDK-blocked funcs remain. So:

- **Next ~1 USA wave finishes `main`** (the ~19), landing USA `main` at ~342.
- **Then USA needs a different lever** to continue: a verified `Fill32` /
  `OS_RestoreIrq` region alias (unblocks the 47), or pivot USA to clean overlay
  funcs (the scout showed overlays mostly port-clean).
- **JPN is the durable bulk engine** (~101 reachable + later its own SDK wall) —
  leaning JPN-heavy is right.

## The MEDIUM-floor error (1 of 40) — caught + localised

One USA MEDIUM port, `func_0209a8c4.legacy.c`, **passed objdiff at 100% but
failed the ROM `sha1`**. The MEDIUM consensus-shift auto-promote resolved one of
its calls to the *wrong adjacent sibling* — `func_0209a900` instead of the
correct `func_0209a874` (a neighbouring func of similar size) — so the linked
`bl` offset was wrong by 3 bytes.

**Two lessons:**

1. **objdiff is NOT a valid check for region carved ports.** It compares the
   built `.o` to its target *symbolically* (the relocation target *name*), so a
   call to the wrong same-shaped sibling still reads as 100%. Only the per-byte
   **`sha1` gate** (and `cmp`) catches a wrong resolution. We always sha1-gate, so
   this is covered — but don't trust a region-port objdiff number.
2. **Localising a `sha1` failure:** `cmp -l build/<region>/build/arm9.bin
   extract/<region>/arm9/arm9.bin` → the differing byte offsets → map offset −
   0x02000000 + base to the owning func via `symbols.txt`. Here it pinned 3 bytes
   to `func_0209a8c4` instantly. Dropped that port and added it to the porter's
   `KNOWN_BAD_OUTPUTS` so it won't re-port.

**MEDIUM error rate so far: 1/70 (~1.4%)** — rare, always gate-caught, cheaply
localised. MEDIUM stays a safe mode *because* we sha1-gate every wave.

## Method

Porter run USA at `--confidence-floor MEDIUM`, JPN at HIGH. Candidate filter stays
HIGH-main + byte-sim 1.000. Both delinks `sort_delinks.py`-canonicalised; static
collision scan clean; `KNOWN_BAD_OUTPUTS` held for the brief-429 compile-fail;
proactive MD018 doc sweep before push.

## Parked (unchanged)

`Fill32`/`OS_RestoreIrq` referencers, the 2 `KNOWN_BAD_OUTPUTS` (compile-fail +
this MEDIUM mis-resolution), duplicate-shape mismatches, and brief 421's divergent
residue (`main` `-244`/0xf4 drift band + overlay-swap group
`{ov000, ov002, ov005, ov008}`).

## Gate

3-region `ninja sha1`: **EUR / USA / JPN all `OK`**.
