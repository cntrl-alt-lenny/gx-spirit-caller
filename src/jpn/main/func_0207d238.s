; func_0207d238 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0207d238
        .arm
func_0207d238:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    ldr r0, [r7, #0x2c]
    mov r6, r1
    cmp r0, #0x0
    mov r5, r2
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, pc}
.L_24:
    ldr r4, [r0, #0xc]
    mov r1, r7
    mov r2, r5
    add r0, r0, #0x10
    blx r6
    mov r0, r4
    cmp r4, #0x0
    bne .L_24
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
