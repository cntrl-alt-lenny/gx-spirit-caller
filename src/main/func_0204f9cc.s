; func_0204f9cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020498f0
        .global func_0204f9cc
        .arm
func_0204f9cc:
    stmdb sp!, {r4, r5, r6, lr}
    mvn r6, #0x0
    mov r5, #0x0
    mov r4, #0x1
.L_10:
    bl func_020498f0
    mov r1, r4, lsl r5
    ldr r0, [r0, #0x2f0]
    add r5, r5, #0x1
    ands r0, r1, r0
    addne r6, r6, #0x1
    cmp r5, #0x20
    blt .L_10
    mvn r0, #0x0
    cmp r6, r0
    bne .L_4c
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0xe]
    ldmia sp!, {r4, r5, r6, pc}
.L_4c:
    bl func_020498f0
    strb r6, [r0, #0xe]
    ldmia sp!, {r4, r5, r6, pc}
