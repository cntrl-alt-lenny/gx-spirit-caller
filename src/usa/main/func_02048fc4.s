; func_02048fc4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dba0
        .extern func_02047790
        .extern func_020553ac
        .global func_02048fc4
        .arm
func_02048fc4:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r3, _LIT0
    mov r6, r0
    ldr r0, [r3]
    mov r5, r1
    mov r4, r2
    cmp r0, #0x0
    beq .L_2c
    bl func_02047790
    cmp r0, #0x0
    bne .L_34
.L_2c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_34:
    mvn r0, #0x0
    cmp r6, r0
    ldreq r0, _LIT0
    ldreq r0, [r0]
    ldreq r0, [r0, #0x4]
    ldreq r0, [r0]
    ldreq r6, [r0, #0x214]
    cmp r5, #0x0
    ldreq r0, _LIT0
    mov r1, r6
    ldreq r0, [r0]
    ldreq r0, [r0, #0x4]
    ldreq r0, [r0]
    addeq r5, r0, #0x218
    cmp r4, #0x0
    ldreq r0, _LIT0
    mov r2, r5
    ldreq r0, [r0]
    ldreq r0, [r0, #0x4]
    ldreq r0, [r0]
    addeq r4, r0, #0x318
    ldr r0, _LIT0
    mov r3, r4
    ldr r0, [r0]
    ldr r0, [r0, #0x4]
    bl func_020553ac
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0219dba0
