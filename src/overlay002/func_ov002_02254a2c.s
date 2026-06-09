; func_ov002_02254a2c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021bb068
        .extern func_ov002_021df680
        .extern func_ov002_021df780
        .global func_ov002_02254a2c
        .arm
func_ov002_02254a2c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    ldr r0, _LIT0
    bl func_ov002_021bb068
    mov r6, r0
    cmp r6, #0x0
    ldmleia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r1, _LIT0
    mvn r0, #0x0
    bl func_ov002_021df680
    mov r5, #0x0
    cmp r6, #0x0
    ldmleia sp!, {r3, r4, r5, r6, r7, pc}
    mov r4, #0x1f4
.L_18a8:
    mov r0, r7
    mov r1, r4
    bl func_ov002_021df780
    add r5, r5, #0x1
    cmp r5, r6
    blt .L_18a8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x0000132c
