; func_ov008_021acc24 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b2b60
        .extern data_ov008_021b2ca0
        .extern func_ov008_021ac350
        .extern func_ov008_021ac3f0
        .global func_ov008_021acc24
        .arm
func_ov008_021acc24:
    stmdb sp!, {r3, lr}
    ldr r2, _LIT0
    ldr r1, _LIT1
    ldrh r3, [r2, #0x4]
    ldrh r2, [r1, #0x5a]
    cmp r0, #0x34
    mov r1, r3, lsl #0x18
    sub ip, r2, #0x6
    mov r1, r1, lsr #0x18
    sub r3, r0, #0x34
    movlt ip, #0x0
    blt .L_6f8
    cmp r0, #0xca
    bgt .L_6f8
    mul r2, r3, ip
    ldr r3, _LIT2
    mov r0, r2, lsr #0x1f
    smull r2, ip, r3, r2
    add ip, r0, ip, asr #0x4
.L_6f8:
    ldr r2, _LIT0
    mov r0, ip, lsl #0x10
    ldrh r3, [r2, #0x4]
    mov r0, r0, lsr #0x10
    and r0, r0, #0xff
    bic r3, r3, #0xff
    orr r0, r3, r0
    strh r0, [r2, #0x4]
    ldrh r0, [r2, #0x4]
    mov r0, r0, lsl #0x18
    mov r2, r0, lsr #0x18
    cmp r2, r1
    ldmeqia sp!, {r3, pc}
    subs r0, r2, r1
    movpl r3, r0
    rsbmi r3, r0, #0x0
    cmp r3, #0x8
    blt .L_748
    bl func_ov008_021ac350
    ldmia sp!, {r3, pc}
.L_748:
    cmp r1, r2
    bge .L_75c
    mov r1, #0x1
    bl func_ov008_021ac3f0
    ldmia sp!, {r3, pc}
.L_75c:
    sub r0, r1, r2
    mov r1, #0x0
    bl func_ov008_021ac3f0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov008_021b2ca0
_LIT1: .word data_ov008_021b2b60
_LIT2: .word 0x1b4e81b5
