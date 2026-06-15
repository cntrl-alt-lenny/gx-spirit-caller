; func_0204fc38 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020498f0
        .extern func_0204fa7c
        .global func_0204fc38
        .arm
func_0204fc38:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    bl func_020498f0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    cmp r5, #0x0
    mov r4, #0x0
    ble .L_218
.L_1e4:
    bl func_020498f0
    add r0, r0, r4, lsl #0x2
    ldr r0, [r0, #0xf4]
    cmp r6, r0
    bne .L_20c
    mov r0, r4
    mov r1, r5
    bl func_0204fa7c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_20c:
    add r4, r4, #0x1
    cmp r4, r5
    blt .L_1e4
.L_218:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
