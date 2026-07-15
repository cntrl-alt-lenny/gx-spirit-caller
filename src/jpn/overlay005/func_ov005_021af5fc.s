; func_ov005_021af5fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020aace8
        .global func_ov005_021af5fc
        .arm
func_ov005_021af5fc:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    add r0, r5, #0x48
    bl func_020aace8
    cmp r4, r0
    movgt r4, r0
    mov r1, #0x0
    cmp r4, #0x0
    mov r2, #0x0
    ble .L_7d4
.L_7bc:
    add r0, r5, r2
    ldrb r0, [r0, #0x68]
    add r2, r2, #0x1
    cmp r2, r4
    add r1, r1, r0
    blt .L_7bc
.L_7d4:
    mov r0, r1
    ldmia sp!, {r3, r4, r5, pc}
