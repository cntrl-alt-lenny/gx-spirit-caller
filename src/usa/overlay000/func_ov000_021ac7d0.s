; func_ov000_021ac7d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov000_021ac840
        .extern func_ov000_021b0d88_unk
        .global func_ov000_021ac7d0
        .arm
func_ov000_021ac7d0:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x110
    mov r5, r2
    mov r6, r1
    mov r2, #0x0
    mov r4, r0
    add r3, sp, #0x10
    add r1, sp, #0x0
    mov r0, r2
.L_24:
    str r3, [r1, r2, lsl #0x2]
    add r2, r2, #0x1
    strb r0, [r3], #0x40
    cmp r2, #0x4
    blt .L_24
    mov r0, r6
    bl func_ov000_021b0d88_unk
    add r1, sp, #0x0
    mov r0, r4
    mov r2, r5
    bl func_ov000_021ac840
    ldr r1, [r4, #0x98]
    and r0, r6, #0xff
    orr r2, r1, #0x10000000
    bic r1, r2, #0xff
    orr r0, r1, r0
    str r0, [r4, #0x98]
    add sp, sp, #0x110
    ldmia sp!, {r4, r5, r6, pc}
