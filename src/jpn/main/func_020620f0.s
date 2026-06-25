; func_020620f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0205405c
        .extern func_020540cc
        .extern func_020627c0
        .global func_020620f0
        .arm
func_020620f0:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    ldr r0, [r7, #0x60]
    mov r6, r1
    bl func_020540cc
    mov r4, r0
    cmp r4, #0x0
    mov r5, #0x0
    ble .L_6c
.L_28:
    ldr r0, [r7, #0x60]
    mov r1, r5
    bl func_0205405c
    mov r1, r0
    ldr r0, [r1, #0xc]
    sub r0, r6, r0
    cmp r0, #0x3e8
    bls .L_60
    mov r0, r7
    bl func_020627c0
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, pc}
.L_60:
    add r5, r5, #0x1
    cmp r5, r4
    blt .L_28
.L_6c:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
