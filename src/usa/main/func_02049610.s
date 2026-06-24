; func_02049610 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dba0
        .extern func_02043868
        .extern func_02047790
        .extern func_02048fc4
        .global func_02049610
        .arm
func_02049610:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x104
    ldr r2, _LIT0
    mov r5, r0
    ldr r0, [r2]
    mov r4, r1
    cmp r0, #0x0
    beq .L_2c
    bl func_02047790
    cmp r0, #0x0
    bne .L_38
.L_2c:
    add sp, sp, #0x104
    mov r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_38:
    add r2, sp, #0x0
    mov r0, r5
    mov r1, r4
    mov r3, #0xff
    bl func_02043868
    mvn r3, #0x0
    cmp r0, r3
    addeq sp, sp, #0x104
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, pc}
    add r2, sp, #0x0
    mov r1, #0x0
    strb r1, [r2, r0]
    mov r0, r3
    bl func_02048fc4
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    add sp, sp, #0x104
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_0219dba0
