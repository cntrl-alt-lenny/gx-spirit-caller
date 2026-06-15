; func_ov004_021d3f44 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_022915e8
        .extern func_0203268c
        .extern func_020337fc
        .global func_ov004_021d3f44
        .arm
func_ov004_021d3f44:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    bne .L_198
    bl func_0203268c
    bl func_020337fc
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
.L_198:
    ldr r0, [r4, #0x258]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_0203268c
    ldr r0, [r0, #0xeb4]
    tst r0, #0x1000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x1
    bne .L_214
    bl func_0203268c
    ldr r0, [r0, #0xeb4]
    mov r1, #0x0
    tst r0, #0x2000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x1
    bne .L_1fc
    mov r0, #0x20
    str r0, [r4, #0x30]
    mov r0, #0x1
    str r0, [r4, #0x38]
    str r1, [r4, #0x3c]
    ldmia sp!, {r4, pc}
.L_1fc:
    mov r0, #0x1f
    str r0, [r4, #0x30]
    mov r0, #0x1
    str r0, [r4, #0x38]
    str r1, [r4, #0x3c]
    ldmia sp!, {r4, pc}
.L_214:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov004_022915e8
