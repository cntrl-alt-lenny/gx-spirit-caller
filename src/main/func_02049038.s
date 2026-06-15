; func_02049038 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dc80
        .extern func_02047804
        .extern func_02055420
        .global func_02049038
        .arm
func_02049038:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r3, _LIT0
    mov r6, r0
    ldr r0, [r3]
    mov r5, r1
    mov r4, r2
    cmp r0, #0x0
    beq .L_b8
    bl func_02047804
    cmp r0, #0x0
    bne .L_c0
.L_b8:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_c0:
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
    bl func_02055420
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0219dc80
