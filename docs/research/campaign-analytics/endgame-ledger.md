# Endgame ledger: remaining uncovered items

Snapshot: 2026-07-15. Build-free transcription of the committed reports.

> This supersedes [path-to-100-coverage.md](path-to-100-coverage.md), which
> was a stale mid-drain snapshot.

## Totals and distance to true 100%

| Region | Named residual entries / populations | ISA-permanent files | Distance to true 100% |
|---|---:|---:|---|
| USA | 7 main-floor parks + ~107 ov002 Wave-11 population | 26 | 7 targeted parks plus Wave 11; 26 files are ISA-permanent |
| JPN | 7 main-floor parks + ~73 ov002 Wave-11 population | 26 | 7 targeted parks plus Wave 11; 26 files are ISA-permanent |
| EUR | 2 data blobs + 11 non-floor ov006 parks + 39 ITCM funcs | 42 | 52 named/countable contingent items; 42 files are ISA-permanent |

The totals deliberately keep populations and permanent ISA files separate:
the source reports do not provide individual addresses for the Wave-11 or
ITCM populations, and the near-miss catalogue is a cross-cutting research
ledger rather than a new ship count. “True 100%” therefore means resolving
the contingent rows below; the ISA rows require inline-assembly wrappers and
are not C-match targets.

## 1. USA/JPN main floor

Brief 563 reports the same seven parked functions in each region: five
verify-fails and two gate-fails. Identical addresses failed identically in
USA and JPN.

| Address | Region | Source report | Status |
|---|---|---|---|
| `020b40cc` | USA | `brief-563-drain-w3plus.md` | Parked — verify-fail |
| `020b40e0` | USA | `brief-563-drain-w3plus.md` | Parked — verify-fail |
| `02099834` | USA | `brief-563-drain-w3plus.md` | Parked — verify-fail |
| `020b2c38` | USA | `brief-563-drain-w3plus.md` | Parked — verify-fail |
| `020b3b84` | USA | `brief-563-drain-w3plus.md` | Parked — verify-fail |
| `02020fa4` | USA | `brief-563-drain-w3plus.md` | Parked — gate-fail |
| `020b3988` | USA | `brief-563-drain-w3plus.md` | Parked — gate-fail |
| `020b40cc` | JPN | `brief-563-drain-w3plus.md` | Parked — verify-fail |
| `020b40e0` | JPN | `brief-563-drain-w3plus.md` | Parked — verify-fail |
| `02099834` | JPN | `brief-563-drain-w3plus.md` | Parked — verify-fail |
| `020b2c38` | JPN | `brief-563-drain-w3plus.md` | Parked — verify-fail |
| `020b3b84` | JPN | `brief-563-drain-w3plus.md` | Parked — verify-fail |
| `02020fa4` | JPN | `brief-563-drain-w3plus.md` | Parked — gate-fail |
| `020b3988` | JPN | `brief-563-drain-w3plus.md` | Parked — gate-fail |

## 2. EUR data blobs

Brief 572 shipped all 77 closeable EUR floor functions. These two known
data blobs remain and are being fixed by Brief 578.

| Address | Region | Source report | Status |
|---|---|---|---|
| `020b2d2c` | EUR | `brief-572-eur-closeout.md` | Verify-fail data blob; pending Brief 578 |
| `020b3c78` | EUR | `brief-572-eur-closeout.md` | Verify-fail data blob; pending Brief 578 |

## 3. ov002 Wave-11 residue

The post-ov002 runbook records the orphaned Wave-11 population after the
pivot logic moved on. Brief 563 explicitly deferred this wave. Brief 575 is
the active follow-up; the runbook does not enumerate individual addresses, so
the population rows below are the complete address information available in
the source report.

| Address | Region | Source report | Status |
|---|---|---|---|
| `ov002 residual population (~107 candidates; addresses not enumerated)` | USA | `post-ov002-runbook.md` § Wave 11; `brief-563-drain-w3plus.md` | Pending Brief 575 |
| `ov002 residual population (~73 candidates; addresses not enumerated)` | JPN | `post-ov002-runbook.md` § Wave 11; `brief-563-drain-w3plus.md` | Pending Brief 575 |

## 4. Permanent ISA floor

These `.s` files contain `mcr`, `mrc`, `swi`, `msr`, or `mrs`. The source
catalogue marks them ISA-permanent: inline-asm-wrapper only; do not spend
lever/permuter effort. The catalogue contains 42 canonical EUR files and 26
each for USA and JPN.

| Address / file | Region | Source report | Status |
|---|---|---|---|
| `BitUnPack.s`, `Div.s`, `GetCRC16.s`, `IsDebugger.s`, `LZ77UnCompReadByCallbackWrite16bit.s`, `Mod.s`, `OS_DisableIrq.s`, `OS_RestoreIrq.s`, `RLUnCompReadByCallbackWrite16bit.s`, `RLUnCompReadNormalWrite8bit.s`, `SoftReset.s`, `VBlankIntrWait.s` | EUR | `cmatch-parked-and-floor.md` | ISA-permanent; inline-asm-wrapper only |
| `func_02000950.s`, `func_020009fc.s`, `func_02000a78.s`, `func_020922d8.s`, `func_02092324.s`, `func_0209286c.s`, `func_02092898.s`, `func_020928cc.s`, `func_020928e8.s`, `func_02092904.s`, `func_02092940.s`, `func_02092e38.s`, `func_02092e90.s`, `func_02092f18.s`, `func_02092fa8.s`, `func_02093790.s`, `func_020937d0.s`, `func_020937e4.s`, `func_020937fc.s`, `func_02093808.s`, `func_020b2978.s`, `func_020b2a10.s`, `func_020b2ab4.s`, `func_020b2b50.s`, `func_020b2bdc.s`, `func_020b2c68.s`, `func_020b2cc4.s`, `func_020b41c0.s`, `func_020b41d4.s`, `func_020b41e8.s` | EUR | `cmatch-parked-and-floor.md` | ISA-permanent; inline-asm-wrapper only |
| `func_02000950.s`, `func_020009fc.s`, `func_02000a78.s`, `func_020921f0.s`, `func_0209223c.s`, `func_02092784.s`, `func_020927b0.s`, `func_020927e4.s`, `func_02092800.s`, `func_0209281c.s`, `func_02092858.s`, `func_02092d50.s`, `func_02092da8.s`, `func_02092e30.s`, `func_02092ec0.s`, `func_020936a8.s`, `func_020936e8.s`, `func_020936fc.s`, `func_02093714.s`, `func_020b2884.s`, `func_020b291c.s`, `func_020b29c0.s`, `func_020b2a5c.s`, `func_020b2ae8.s`, `func_020b2b74.s`, `func_020b2bd0.s` | JPN | `cmatch-parked-and-floor.md` | ISA-permanent; inline-asm-wrapper only |
| `func_02000950.s`, `func_020009fc.s`, `func_02000a78.s`, `func_020921f0.s`, `func_0209223c.s`, `func_02092784.s`, `func_020927b0.s`, `func_020927e4.s`, `func_02092800.s`, `func_0209281c.s`, `func_02092858.s`, `func_02092d50.s`, `func_02092da8.s`, `func_02092e30.s`, `func_02092ec0.s`, `func_020936a8.s`, `func_020936e8.s`, `func_020936fc.s`, `func_02093714.s`, `func_020b2884.s`, `func_020b291c.s`, `func_020b29c0.s`, `func_020b2a5c.s`, `func_020b2ae8.s`, `func_020b2b74.s`, `func_020b2bd0.s` | USA | `cmatch-parked-and-floor.md` | ISA-permanent; inline-asm-wrapper only |

## 5. Parked near-miss C-match families

These are the parked families transcribed from the Brief 568 catalogue. The
source does not assign a region to every family, so the region field is
recorded as `source unspecified` rather than inferred.

| Address(es) | Region | Source report | Status / exact diff-type |
|---|---|---|---|
| `02047fb8`, `02048880`, `0204ab88` | source unspecified | `cmatch-parked-and-floor.md` (Brief 562) | Parked near-miss — register allocation / constant rematerialization; 24-byte distance |
| `02089df8`, `02089e70`, `02089ee8` | source unspecified | `cmatch-parked-and-floor.md` (Brief 562) | Parked near-miss — stack layout, push/pop-folded slot vs `sub/add sp`; 12-byte distance |
| `0208df0c`, `0208df60`, `0208e1cc`, `0208e220` | source unspecified | `cmatch-parked-and-floor.md` (Brief 562) | Parked near-miss — MMIO register numbering; 4-byte distance |
| `0207103c` | source unspecified | `cmatch-parked-and-floor.md` (Briefs 520, 527) | Parked near-miss — 64-bit scheduling/permuter wall; 69 diff bytes / 6 runs |
| `02078ebc` | source unspecified | `cmatch-parked-and-floor.md` (Brief 520) | Parked near-miss — volatile-load destination; 1 diff byte / 1 run |
| `0202e5ac` | source unspecified | `cmatch-parked-and-floor.md` (Brief 527) | Parked permuter-class — immediate decomposition; distance not stated |
| `02054b44` | source unspecified | `cmatch-parked-and-floor.md` (Brief 527) | Parked compiler-fixed idiom — mask lowering; distance not stated |
| `0208ddec` | source unspecified | `cmatch-parked-and-floor.md` (Brief 527) | Parked permuter-class — scheduling; distance not stated |
| `02010a98` | source unspecified | `cmatch-parked-and-floor.md` (Brief 528) | Parked near-miss — register substitution; 20-byte distance |
| `0201934c` | source unspecified | `cmatch-parked-and-floor.md` (Brief 528) | Parked near-miss — jump-table construction; 17-byte distance |
| `0201d620` | source unspecified | `cmatch-parked-and-floor.md` (Brief 528) | Parked permuter-class — scheduling/register allocation; distance not stated |
| `021b79ac`, `021ac91c` | source unspecified | `cmatch-parked-and-floor.md` (Brief 523) | Parked near-miss — overlay register-role swap; distance not stated |
| `021b5f60` | source unspecified | `cmatch-parked-and-floor.md` (Brief 525) | Parked near-miss — register choice; 60 → 28 byte diff during investigation |
| `021ac91c`, `021b7a20` | source unspecified | `cmatch-parked-and-floor.md` (Brief 529) | Parked near-miss — contained register allocation; 38 bytes / 8 runs each |
| `0200dd58` | source unspecified | `cmatch-parked-and-floor.md` (Briefs 533, 535) | Parked permuter-class — register-role swap; 20 bytes / 11 runs |
| `02072444` | source unspecified | `cmatch-parked-and-floor.md` (Brief 530) | Parked near-miss — register pressure; 35-byte distance |
| `0205340c` | source unspecified | `cmatch-parked-and-floor.md` (Brief 530) | Parked near-miss — prologue register footprint; 90-byte contained miss |
| `021ae218` | source unspecified | `cmatch-parked-and-floor.md` (Brief 536) | Parked near-miss — overlay tail register swap; 6-byte distance |
| `020384e8` | source unspecified | `cmatch-parked-and-floor.md` (Brief 536) | Parked near-miss — loop register role; distance not stated |
| `021b0a30` | source unspecified | `cmatch-parked-and-floor.md` (Brief 536) | Parked near-miss — parity-tail form; alternate 208B/224B around 220B target |
| `0228791c` | source unspecified | `cmatch-parked-and-floor.md` (Brief 536) | Parked near-miss — fused bit-XOR sequence; final 4 bytes |

## 6. EUR non-floor parks from Brief 572

These are outside the 79-function closeout floor. They are included so the
ledger does not mistake the successful 77/77 closeout for a clean EUR tree.

| Address | Region | Source report | Status |
|---|---|---|---|
| `021b5c28` | EUR / ov006 | `brief-572-eur-closeout.md` | Parked — verify-fail, non-floor |
| `021b9ef4` | EUR / ov006 | `brief-572-eur-closeout.md` | Parked — verify-fail, non-floor |
| `021c1558` | EUR / ov006 | `brief-572-eur-closeout.md` | Parked — verify-fail, non-floor |
| `021c19a4` | EUR / ov006 | `brief-572-eur-closeout.md` | Parked — verify-fail, non-floor |
| `021c5080` | EUR / ov006 | `brief-572-eur-closeout.md` | Parked — verify-fail, non-floor |
| `021c6960` | EUR / ov006 | `brief-572-eur-closeout.md` | Parked — verify-fail, non-floor |
| `021c6bfc` | EUR / ov006 | `brief-572-eur-closeout.md` | Parked — verify-fail, non-floor |
| `021c7558` | EUR / ov006 | `brief-572-eur-closeout.md` | Parked — verify-fail, non-floor |
| `021c9ed0` | EUR / ov006 | `brief-572-eur-closeout.md` | Parked — verify-fail, non-floor |
| `021cac0c` | EUR / ov006 | `brief-572-eur-closeout.md` | Parked — verify-fail, non-floor |
| `021cb02c` | EUR / ov006 | `brief-572-eur-closeout.md` | Parked — verify-fail, non-floor |

## 7. ITCM unreachable population

The r4 swarm report records **39 uncarved ITCM functions** in its B-tier
discussion as a lane no current tool reaches. It does not publish the 39
addresses. The ledger therefore records the source's count without inventing
addresses; these rows are a count-level residual, not an address census.

| Address | Region | Source report | Status |
|---|---|---|---|
| `ITCM residual set: 39 addresses not enumerated in source report` | EUR | `improvement-swarm-2026-07-12-r4.md` (B-tier) | Uncarved; no current tool reaches |

## Appendix: ITCM detail

Generated by `tools/size_census.py --module itcm`; rows are unmatched functions
from the committed regional symbol and delink files.

| Name | Address | Size | Region |
|---|---|---:|---|
| `func_01ff8000` | `0x01ff8000` | `0x98` | EUR |
| `func_01ff8098` | `0x01ff8098` | `0xe8` | EUR |
| `func_01ff8180` | `0x01ff8180` | `0x58` | EUR |
| `func_01ff81d8` | `0x01ff81d8` | `0x15c` | EUR |
| `func_01ff8334` | `0x01ff8334` | `0xcc` | EUR |
| `func_01ff8414` | `0x01ff8414` | `0x130` | EUR |
| `func_01ff8544` | `0x01ff8544` | `0xe0` | EUR |
| `func_01ff8624` | `0x01ff8624` | `0x40` | EUR |
| `func_01ff8664` | `0x01ff8664` | `0x60` | EUR |
| `func_01ff86c4` | `0x01ff86c4` | `0x38` | EUR |
| `func_01ff87c0` | `0x01ff87c0` | `0xac` | EUR |
| `func_01ff8000` | `0x01ff8000` | `0x98` | USA |
| `func_01ff8098` | `0x01ff8098` | `0xe8` | USA |
| `func_01ff8180` | `0x01ff8180` | `0x58` | USA |
| `func_01ff81d8` | `0x01ff81d8` | `0x15c` | USA |
| `func_01ff8334` | `0x01ff8334` | `0xcc` | USA |
| `func_01ff8400` | `0x01ff8400` | `0x14` | USA |
| `func_01ff8414` | `0x01ff8414` | `0x130` | USA |
| `func_01ff8544` | `0x01ff8544` | `0xe0` | USA |
| `func_01ff8624` | `0x01ff8624` | `0x40` | USA |
| `func_01ff8664` | `0x01ff8664` | `0x60` | USA |
| `func_01ff86c4` | `0x01ff86c4` | `0x38` | USA |
| `func_01ff86fc` | `0x01ff86fc` | `0x74` | USA |
| `func_01ff8770` | `0x01ff8770` | `0x50` | USA |
| `func_01ff87c0` | `0x01ff87c0` | `0xac` | USA |
| `func_01ff8000` | `0x01ff8000` | `0x98` | JPN |
| `func_01ff8098` | `0x01ff8098` | `0xe8` | JPN |
| `func_01ff8180` | `0x01ff8180` | `0x58` | JPN |
| `func_01ff81d8` | `0x01ff81d8` | `0x15c` | JPN |
| `func_01ff8334` | `0x01ff8334` | `0xcc` | JPN |
| `func_01ff8400` | `0x01ff8400` | `0x14` | JPN |
| `func_01ff8414` | `0x01ff8414` | `0x130` | JPN |
| `func_01ff8544` | `0x01ff8544` | `0xe0` | JPN |
| `func_01ff8624` | `0x01ff8624` | `0x40` | JPN |
| `func_01ff8664` | `0x01ff8664` | `0x60` | JPN |
| `func_01ff86c4` | `0x01ff86c4` | `0x38` | JPN |
| `func_01ff86fc` | `0x01ff86fc` | `0x74` | JPN |
| `func_01ff8770` | `0x01ff8770` | `0x50` | JPN |
| `func_01ff87c0` | `0x01ff87c0` | `0xac` | JPN |

## Source accounting notes

- Brief 563's USA/JPN main floor is 14 entries total, seven per region.
- Brief 572 reports 77/77 closeable EUR functions shipped, with the two data
  blobs and 11 non-floor ov006 verify-fails left behind.
- The permanent ISA catalogue is 94 files total: 42 EUR, 26 USA, 26 JPN.
- The near-miss families are intentionally not added to the regional totals:
  their source report does not provide a complete region assignment and they
  overlap the permanent/contingent research ledger rather than representing a
  fresh mechanical-carve queue.
