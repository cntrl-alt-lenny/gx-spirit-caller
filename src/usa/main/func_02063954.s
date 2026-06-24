; func_02063954 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0205405c
        .extern func_020540cc
        .extern func_020639d8
        .extern func_02063c30
        .global func_02063954
        .arm
func_02063954:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
.L_8:
    ldr r0, [r6, #0x5c]
    bl func_020540cc
    subs r5, r0, #0x1
    bmi .L_7c
.L_18:
    ldr r0, [r6, #0x5c]
    mov r1, r5
    bl func_0205405c
    mov r4, r0
    ldrh r1, [r4, #0xc]
    ldrh r0, [r6, #0x66]
    cmp r1, r0
    bne .L_74
    ldr ip, [r6, #0x44]
    ldr r2, [r4]
    ldr r1, [r4, #0x8]
    ldr r3, [r4, #0x4]
    mov r0, r6
    add r2, ip, r2
    bl func_02063c30
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl func_020639d8
    b .L_8
.L_74:
    subs r5, r5, #0x1
    bpl .L_18
.L_7c:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
