; Brief 192 worked example — cross-overlay hardcoded BL wall.
;
; func_ov011_021d2c64 is a 40-byte ARM function with two BLs in
; its body:
;
;   1. `bl Task_PostLocked`   — resolvable, target lives in main
;      at 0x020067fc. dsd's relocs.txt records it as
;      `kind:arm_call to:0x020067fc module:main`, so mwldarm
;      resolves it at link time via the symbol table.
;
;   2. `bl 0x021b5500`        — HARDCODED. The target address
;      0x021b5500 falls inside a multi-overlay shared base
;      (`0x021b2280`, owned by ov006/ov007/ov010/ov014/ov015/
;      ov016/ov017/ov019/ov023) AND the ov000 shared base
;      (`0x021aa4a0`, also covering 0x021b5500). dsd cannot pick
;      which overlay owns the target, so it emits the bytes
;      verbatim with `kind:arm_call to:0x021b5500 module:none`
;      and NO R_ARM_PC24 reloc. A naive `.c` source-claim with
;      `extern void func_021b5500(void); bl func_021b5500();`
;      fails to link:
;
;          mwldarm.exe: Undefined : "func_021b5500"
;          mwldarm.exe: Referenced from "func_ov011_021d2c64"
;                       in ov011_021d2c64.o
;          mwldarm.exe: alert: Link failed.
;
; Brief 192 Part 2 — option (2) recipe (hand-encoded BL):
;
;   The precedent for this pattern is `src/main/func_020b3814.s`
;   (brief's medium-tier 64-bit-divide tail). That file
;   hand-encodes two inter-function branches as raw `.word`
;   directives because mwldarm has no symbol to resolve them
;   to. Same idea applies here: emit the BL bytes verbatim as
;   a 32-bit `.word`. Pre-compute the ARM `bl` encoding:
;
;       bl 0x021b5500 from PC=0x021d2c80:
;         offset = (0x021b5500 - (0x021d2c80 + 8)) / 4 = -0x75e2
;         encoding = 0xeb000000 | (-0x75e2 & 0xffffff) = 0xebff8a1e
;
;       This matches the baserom bytes `1e 8a ff eb` verbatim.
;
;   Because the host function's link-time address is pinned to
;   0x021d2c64 (by the dsd/mwldarm overlay-layout LCF + brief
;   180 patcher's TU-shift cap), the precomputed displacement
;   stays correct after link.
;
;   Why NOT a `.c` claim:
;     - Option (1) was "extend `dsd init --allow-unknown-function-
;       calls` to add a placeholder symbol at 0x021b5500." dsd
;       already runs with that flag in this project (see CLAUDE.md
;       § "Bootstrapping `config/<ver>/`"), and DOES create
;       `func_ovNNN_021xxxxx_unk` placeholders for some
;       unresolved BLs. But the placeholder mechanism only fires
;       for BLs dsd can attribute to a SINGLE module's analysis
;       graph. For multi-overlay shared-base ranges where dsd
;       cannot pick the owner module, the reloc remains
;       `module:none` and no placeholder is emitted. Fixing this
;       would require upstream dsd changes — out of scope for
;       brief 192. The `.s` recipe is shippable today.

        .text
        .extern Task_PostLocked
        .global func_ov011_021d2c64
        .arm
func_ov011_021d2c64:
        stmdb   sp!, {r3, r4, r5, lr}
        mov     r5, r0
        mov     r0, #0x44
        mov     r1, #0x4
        mov     r2, #0x0
        bl      Task_PostLocked
        mov     r4, r0
        .word   0xebff8a1e                      ; bl 0x021b5500 (cross-overlay, mod:none)
        str     r4, [r5]
        ldmia   sp!, {r3, r4, r5, pc}
