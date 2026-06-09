; func_ov002_022374e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021de408
        .extern func_ov002_021df818
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_021e961c
        .extern func_ov002_02257750
        .global func_ov002_022374e8
        .arm
func_ov002_022374e8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov002_021e2b3c
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r2, #0x12c
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_021df818
    ldr r1, _LIT0
    mov r0, r4
    bl func_ov002_02257750
    mov r1, r0
    mov r0, r4
    bl func_ov002_021de408
    bl func_ov002_021e2c5c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word func_ov002_021e961c
