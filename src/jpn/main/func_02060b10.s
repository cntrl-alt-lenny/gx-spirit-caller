; func_02060b10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219e438
        .extern func_0205405c
        .extern func_020540cc
        .global func_02060b10
        .arm
func_02060b10:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r3, _LIT0
    mov r7, r0
    ldr r0, [r3]
    mov r6, r1
    cmp r0, #0x0
    mov r5, r2
    mvneq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r4, #0x0
    bl func_020540cc
    cmp r0, #0x0
    ble .L_6e4
    ldr r8, _LIT0
.L_69c:
    ldr r0, [r8]
    mov r1, r4
    bl func_0205405c
    ldr r1, [r0]
    cmp r1, r7
    bne .L_6d0
    ldr r1, [r0, #0x4]
    cmp r1, r6
    bne .L_6d0
    ldr r0, [r0, #0x8]
    cmp r0, r5
    moveq r0, r4
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
.L_6d0:
    ldr r0, [r8]
    add r4, r4, #0x1
    bl func_020540cc
    cmp r4, r0
    blt .L_69c
.L_6e4:
    mvn r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_0219e438
