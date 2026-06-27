; func_ov002_022b005c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cc7cc
        .extern data_ov002_022cc7e8
        .extern data_ov002_022cd73c
        .extern func_02006c0c
        .extern Task_Invoke
        .extern func_0201d738
        .extern func_0208fd30
        .global func_ov002_022b005c
        .arm
func_ov002_022b005c:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r3, [r0]
    mov r4, r2
    cmp r3, r1
    beq .L_488
    cmp r3, #0x0
    movlt r2, #0x1
    movge r2, #0x0
    mov r2, r2, lsl #0x7
    rsb r2, r2, #0x100
    str r2, [r0, #0x10]
    str r1, [r0]
    mov r1, #0x7
    str r1, [r0, #0x4]
.L_488:
    ldr r1, [r0, #0x4]
    cmp r1, r4
    strne r4, [r0, #0x4]
    cmpne r4, #0x7
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT0
    ldr r2, [r0]
    ldr r0, [r1, #0x4]
    mov r1, #0x4
    cmp r2, r0
    ldreq r0, _LIT1
    mov r2, #0x0
    ldrne r0, _LIT2
    bl func_02006c0c
    mov r5, r0
    bl func_0201d738
    add r0, r0, r4, lsl #0xa
    mov r1, #0x2c00
    mov r2, #0x400
    bl func_0208fd30
    mov r0, r5
    bl Task_Invoke
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cd73c
_LIT1: .word data_ov002_022cc7cc
_LIT2: .word data_ov002_022cc7e8
