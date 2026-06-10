; func_ov002_022936e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021c8470
        .extern func_ov002_0227d82c
        .global func_ov002_022936e0
        .arm
func_ov002_022936e0:
    stmdb sp!, {r3, lr}
    ldrh r0, [r0, #0x2]
    mov r1, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0227d82c
    mvn r1, #0x0
    cmp r0, r1
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r0, r0, #0xff
    and r1, r1, #0xff
    bl func_ov002_021c8470
    ldr r1, _LIT0
    cmp r0, r1
    movlt r0, #0x1
    movge r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word 0x000008fc
