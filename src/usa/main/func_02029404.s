; func_02029404 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern func_0202252c
        .global func_02029404
        .arm
func_02029404:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    add r0, r4, #0x100
    ldrsh r0, [r0, #0x84]
    add r5, r4, #0x87
    cmp r0, #0x0
    blt .L_c44
    bl func_0202252c
    add r0, r4, #0x100
    mvn r1, #0x0
    strh r1, [r0, #0x84]
    ldrb r0, [r5, #0x100]
    bic r0, r0, #0x1
    strb r0, [r5, #0x100]
.L_c44:
    ldr r0, [r4, #0x188]
    cmp r0, #0x0
    beq .L_c5c
    bl Task_InvokeLocked
    mov r0, #0x0
    str r0, [r4, #0x188]
.L_c5c:
    add r1, r4, #0x100
    ldrh r2, [r1, #0x9a]
    mov r0, #0x1
    bic r2, r2, #0x1
    strh r2, [r1, #0x9a]
    ldmia sp!, {r3, r4, r5, pc}
