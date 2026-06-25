; func_02051ed4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0204fde0
        .extern func_020522f8
        .global func_02051ed4
        .arm
func_02051ed4:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    mov r4, r1
    bl func_020522f8
    ldrb r1, [r0, #0x1e]
    strb r1, [r0, #0x1d]
    ldrh r1, [r0, #0x22]
    cmp r1, #0x2
    beq .L_3c
    cmp r1, #0x3
    beq .L_3c
    cmp r1, #0x4
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, pc}
.L_3c:
    mov r0, r5
    mov r2, r4
    bl func_0204fde0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
