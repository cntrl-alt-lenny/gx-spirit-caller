; func_02068fd8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02068fd8
        .arm
func_02068fd8:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r2
    mov r4, r3
    cmp r1, #0x0
    beq .L_118
    cmp r1, #0x1
    beq .L_100
    cmp r1, #0x2
    beq .L_130
    b .L_144
.L_100:
    ldr r3, [r4, #0x634]
    ldr ip, [r4, #0x630]
    mov r0, r4
    mov r1, #0x2
    blx ip
    b .L_144
.L_118:
    ldr r3, [r4, #0x634]
    ldr ip, [r4, #0x630]
    mov r0, r4
    mov r1, #0x1
    blx ip
    b .L_144
.L_130:
    ldr r3, [r4, #0x634]
    ldr ip, [r4, #0x630]
    mov r0, r4
    mov r1, #0x4
    blx ip
.L_144:
    cmp r5, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
    ldr r1, [r5]
    ldr r0, [r4, #0x628]
    cmp r1, r0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, pc}
    add r0, r4, #0x600
    ldrh r1, [r5, #0x4]
    ldrh r0, [r0, #0x2c]
    cmp r1, r0
    moveq r0, #0x0
    streq r0, [r4, #0x628]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
