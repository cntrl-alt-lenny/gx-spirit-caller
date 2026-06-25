[//]: # (markdownlint-disable MD013 MD041)

# Brief 484 — ov002 `.s` drain COMPLETE (143 ships; ov002 mechanically drained)

**Brief:** 484 (scaffolder), long autonomous session. Drain EUR ov002 hard via
rolling `batch_carve` batches, lower half then upper, stacking PRs 484/486/488…
until ov002 (both halves) is drained or ~4 PRs are stacked.

## Headline — 143 ov002 `.s` carved; ov002 is now FULLY DRAINED of shippable `.s` (ONE PR, not a stack)

**143 byte-exact ov002 `.s` carved + committed on this branch.** After this wave
ov002 has **51 uncarved funcs left, and every one of them REFUSES to carve** — so
ov002's mechanical-`.s` lane is **finished in a single PR**. There is no basis for
the planned 486/488 stack (see "Census reality" — the brief's 1,000–1,500 runway
did not exist).

Commits (6), continuing smallest-first from brief 482's `0x254` straight up the
big-body tail to the `0x99c` monsters:

| commit | ships | size band | note |
|---|---:|---|---|
| `293072d7` | 33 | 0x258–0x2bc | salvage (cycle-1 death, see below) |
| `23eceeae` | 25 | 0x2c0–0x318 | auto |
| `1345196c` | 25 | 0x318–0x3c4 | auto |
| `d754be71` | 25 | 0x3cc–0x508 | auto |
| `aef649f2` | 25 | 0x518–0x770 | auto |
| `6863a63a` | 10 | 0x7a4–0x99c | auto (final) |

All 143 are lower-half (`<0x02234000`). `batch_carve` cycle-2 self-reported
`SHIPPED 110 | REFUSE 2 | verify-fail 0 | gate-fail 0 | clean-rate 98%`.

## ⚠️ Census reality — ov002 was already ~95% carved; the brief's premise was stale

At branch (`origin/main` `5455ba7e`): **3578/3772 ov002 funcs already carved
(94.9%), only 194 uncarved.** The brief expected "fresh runway" on the UPPER half,
but UPPER had **only 32 uncarved** (30 ≤0x80 residue + 2 parked) — it had already
been drained (decomper hand-probe waves 440–448). The real shippable remainder was
**143 lower big bodies + 0 upper** — exactly what this wave drained. **There was no
1,000–1,500-ship runway and no second chunk to stack**; ov002 mechanical-`.s` is a
one-PR finish. Flagging so 486/488 aren't expected.

## ov002 final state — 51 refuse, fully characterized (the brief's tooling-lever ask)

| remainder | n | refuse reason | lever |
|---|---:|---|---|
| lower ≤0x80 | 19 | bytepack / argpack / `kind:data` (in `known_drops_ov002.txt`, 43) | clean-C (hand) |
| upper ≤0x80 | 30 | same + `to_mwasm` verify-fail (`known_verifyfail_ov002.txt`, 19) | clean-C + to_mwasm tooling |
| upper >0x200 | 2 | **`kind:data`-bundle ref (brief-361 class)** | decomp/data-bundle tooling |

The 2 upper big bodies are the only non-trivial refuses:

- `func_ov002_022b867c` (0x248) → references `data_ov002_022ccc60`, **C-absorbed**
  into bundle TU `data_ov002_022ccc5c` which has **no linkable definition** →
  `mwldarm Undefined` (brief-361 data-reloc class).
- `func_ov002_022b5590` (0x3cc) → references `data_ov002_022ccc24`; one ref
  A-aligned (ok) but the bundle base `data_ov002_022cccc0` is C-absorbed with no
  linkable definition → same `kind:data` preflight REFUSE.

Both need the **data bundle resolved/split before they can ship** — a decomp +
linker-tooling lever, not mechanical `.s`. They are `batch_carve`-"parked".

## ⚠️ RECURRING `batch_carve` exit-127 under concurrent load + the `--batch 25` mitigation

`batch_carve` **died with exit 127 again** (as in brief 482) — a subprocess-spawn
failure under heavy concurrent load (the decomper runs `batch_carve --version jpn`
+ `asm_escape` simultaneously; both agents saturate the box). Cycle 1 (`--batch
50`) died at 33 carves, 0 committed. Recovery (proven, brief 482): its python had
already exited (no orphan), the 33 `.s` were each individually `asm_escape`-verified
→ `sort_delinks` + EUR gate by hand → committed (`293072d7`).

**MITIGATION FOUND: `--batch 25` is materially more death-resilient than `--batch
50`.** Restarted as cycle 2 with `--batch 25`; it ran **5 clean batches (110 ships)
to a normal exit-0, zero deaths** — smaller batches commit before the death-point,
so durable progress lands and a death (if any) loses ≤25. Recommend `--batch 25`
as the default for long ov002 runs while the decomper co-runs.

## ⚠️ Throughput — the >0x300 monster tail is slow (≈0.25 `.s`/min)

The drained funcs run `0x258`→`0x99c` (600 B → 2.4 KB; ~150–615 instructions). The
`>0x300` tier carves at **≈0.25/min** (asm_escape per-func cost on huge bodies,
plus decomper contention); 143 took ≈11 h wall-clock. This is the bottom of the
ov002 barrel — the highest-effort reg-alloc walls.

## Gate — 3-region `ninja sha1`

| EUR | USA | JPN |
|:---:|:---:|:---:|
| **OK** | **OK** (unaffected — `src/overlay002/*.s` is EUR-only, region-excluded) | **OK** |

Each batch was EUR-sha1-gated at commit (ov002 `.s` are EUR-only so USA/JPN are
byte-identical by construction); the final 143-ship tree was re-confirmed 3-region.

## ⚠️ RECOMMENDATION — ov002 mechanical-`.s` is DONE; pivot the lane

ov002 (both halves) is drained of everything `batch_carve` can ship. The 51 refuse
are **decomp/tooling levers** (the 2 `kind:data`-bundle funcs + the `to_mwasm`
verify-fails) or **clean-C hand work** (bytepack/argpack) — not the mechanical-`.s`
lane. Per [[eur-frontier-tail]] the EUR closeout is now decomp/tooling, not
mechanical `.s`. Recommend the brain redirect the scaffolder lane to **USA/JPN
consolidation** (port the EUR `.s` tree across regions) or the **EUR hard-tail
campaign**, rather than a 486/488 stack on an empty ov002.

## Files

`src/overlay002/` +143 `.s`; `arm9/overlays/ov002/delinks.txt` +143
(sort-normalised). No main/USA/JPN change.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
