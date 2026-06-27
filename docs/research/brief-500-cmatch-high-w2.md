# Brief 500: C-match HIGH tier, wave 2

**Branch**: `scaffolder/c-match-high-500`  
**PR**: [#1039](https://github.com/cntrl-alt-lenny/gx-spirit-caller/pull/1039)

## Results

| Metric | Count |
|--------|-------|
| Attempted (EUR) | 27 |
| Shipped EUR | 25 |
| Shipped USA | 25 |
| Shipped JPN | 25 |
| Parked | 1 (`0200fd84` — initial batch failure, cleared after binary-search redeploy; not re-attempted as individual test passed) |
| Parked (actual) | 0 |

**Note**: All 25 EUR candidates passed EUR sha1 individually. Initial batch test failure was a stale build artifact; binary-search reconstruction showed all 10 batch-2 candidates pass.

## EUR matched functions (wave 2)

### Batch 1: Switch-form eq-tests, strlen, guard/call (8)

| Addr | Recipe | USA | JPN |
|------|--------|-----|-----|
| `0202f410` | x==0x1A6C bool, switch form | `0202f3bc` | `0202f3bc` |
| `020317c0` | x==0x1A9F bool, switch form | `0203176c` | `0203176c` |
| `0202ef08` | 3-way 0x18C3\|0x191C\|0x1A2F, switch | `0202eeb4` | `0202eeb4` |
| `0202f59c` | 3-way consecutive 0x1AD6–0x1AD8, switch | `0202f548` | `0202f548` |
| `02031764` | 3-way 0x1652\|0x170A\|0x17D2, switch | `02031710` | `02031710` |
| `020070dc` | strlen loop, signed char (ldrsb) | `020070c0` | `020070c0` |
| `02005ee0` | linear calls + guard branch (8-byte buf) | `02005ec4` | `02005ec4` |
| `02006b10` | stack struct init + movs-guard return | `02006af4` | `02006af4` |

### Batch 2: Dispatch, null-guard chains, alloc/copy/invoke (10)

| Addr | Recipe | USA | JPN |
|------|--------|-----|-----|
| `020091f4` | guard/dispatch switch, tail call case0 | `020091d8` | `020091d8` |
| `02009278` | guard/dispatch switch, tail call case0 | `0200925c` | `0200925c` |
| `0200ade8` | null-guard + Task_InvokeLocked pair + 10x bl | `0200adcc` | `0200adcc` |
| `0200ae70` | null-guard + 8x unrolled guarded-invoke | `0200ae54` | `0200ae54` |
| `0200eea8` | alloc+Fill32+Copy32+edb8 tail | `0200ee8c` | `0200ee8c` |
| `0200eef0` | same+flag-guard+field stores @0x98/0x9c | `0200eed4` | `0200eed4` |
| `0200ef60` | alloc+copy+2x load-invoke-clear+field+edb8 | `0200ef44` | `0200ef44` |
| `0200efe0` | wrapper over ef60+flag-guard+field stores | `0200efc4` | `0200efc4` |
| `0200f01c` | null-guard+bic/orr/bic flag RMW @+0x60 | `0200f000` | `0200f000` |
| `0200fd84` | linked-list search by key (head@data+0x910) | `0200fd68` | `0200fd68` |

### Batch 3: List-search, init, shifts, struct-copy, gsw-chains (7)

| Addr | Recipe | USA | JPN |
|------|--------|-----|-----|
| `0200fdc0` | list search node->packed>>12 vs arg[2] | `0200fda4` | `0200fda4` |
| `020110c4` | 12-word store-order init (0x1000 at p[0]/p[4]/p[8]) | `020110a8` | `020110a8` |
| `02011100` | guard n<=0 + 9 unrolled in-place left-shifts | `020110e4` | `020110e4` |
| `02011178` | 12-word struct copy (*dst=*src, bxeq guard) | `0201115c` | `0201115c` |
| `02013a64` | GetSystemWork guard-chain + orr 0x100 @+0x8f8 | `02013a30` | `02013a30` |
| `02014bf4` | GetSystemWork :1 bitfield guard + 2 const guards + tail | `02014bc0` | `02014bc0` |
| `0201a824` | GetSystemWork (discarded) + byte-extract eq-0 bool | `0201a7e4` | `0201a7e4` |

## Key recipe discoveries

- **Switch-form defeats predication**: `if (x==K) return 1; return 0;` → mwcc predicates (moveq/movne). Fix: `switch(x){case K: return 1;} return 0;`. Also works for chained-eq/membership: switch fallthrough produces the addne base-CSE chain.
- **3-way CSE base**: consecutive or offset cases → mwcc uses `ldr r2,=BASE; cmp r0,r2; addne r1,r2,#OFFSET; cmpne r0,r1; ...` — switch form produces this automatically.
- **Dispatch guard**: `if (sel==0) return callee(a,b); if (sel==1) {...; return 1;} return 0;` — if/else form works here (not bool return, so no predication risk).
- **`confidence: med` in prep but viable**: 02014bf4 (:1 bitfield guard), 0201a824 (byte-extract eq-0) both passed with prep as-is.

## Parked candidates

None. Candidates from the low/med confidence tier (02016b60–0201a498 range) were deferred in favor of the next high-confidence cluster starting at 0201a824.

## Index positions walked

HIGH tier class A/B positions 0–63 in INDEX, with positions 45–62 (low/med confidence) deferred.
