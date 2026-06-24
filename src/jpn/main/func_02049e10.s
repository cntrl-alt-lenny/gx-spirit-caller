; func_02049e10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02049868
        .extern func_0204987c
        .extern func_0204a93c
        .extern func_0204ecdc
        .global func_02049e10
        .arm
func_02049e10:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0x1
    bne .L_138
    mov r0, #0x6
    bl func_02049868
    b .L_158
.L_138:
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0x6
    beq .L_158
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0xb
    ldmneia sp!, {r4, pc}
.L_158:
    bl func_0204987c
    ldr r0, [r0, #0x178]
    cmp r4, r0
    bne .L_17c
    bl func_0204987c
    ldrb r1, [r0, #0x174]
    add r1, r1, #0x1
    strb r1, [r0, #0x174]
    b .L_190
.L_17c:
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x174]
    bl func_0204987c
    str r4, [r0, #0x178]
.L_190:
    bl func_0204987c
    mov r2, #0x0
    str r2, [r0, #0x17c]
    str r2, [r0, #0x180]
    mov r1, r4
    mov r0, #0x1
    bl func_0204ecdc
    bl func_0204a93c
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    bl func_0204987c
    mov r1, #0xff
    strb r1, [r0, #0x3c4]
    ldmia sp!, {r4, pc}
