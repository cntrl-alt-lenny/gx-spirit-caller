; func_02049fb0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dbd4
        .extern data_0219dbd5
        .extern data_0219dbdc
        .extern func_0204987c
        .extern func_02067220
        .extern func_02067280
        .global func_02049fb0
        .arm
func_02049fb0:
    stmdb sp!, {r4, lr}
    mov r4, r1
    cmp r0, #0x32
    bgt .L_3c
    cmp r0, #0x32
    bge .L_84
    cmp r0, #0xa
    bgt .L_e0
    cmp r0, #0x8
    blt .L_e0
    cmp r0, #0x8
    beq .L_5c
    cmp r0, #0xa
    beq .L_70
    b .L_e0
.L_3c:
    sub r1, r0, #0x33
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_e0
    b .L_98
    b .L_ac
    b .L_c0
    b .L_d0
.L_5c:
    bl func_0204987c
    ldrb r1, [r0, #0x14]
    mov r0, r4
    bl func_02067280
    ldmia sp!, {r4, pc}
.L_70:
    bl func_0204987c
    ldrb r1, [r0, #0x16]
    mov r0, r4
    bl func_02067280
    ldmia sp!, {r4, pc}
.L_84:
    bl func_0204987c
    ldr r1, [r0, #0x1f8]
    mov r0, r4
    bl func_02067280
    ldmia sp!, {r4, pc}
.L_98:
    bl func_0204987c
    ldrb r1, [r0, #0x15]
    mov r0, r4
    bl func_02067280
    ldmia sp!, {r4, pc}
.L_ac:
    bl func_0204987c
    ldr r1, [r0, #0x20]
    mov r0, r4
    bl func_02067280
    ldmia sp!, {r4, pc}
.L_c0:
    mov r0, r4
    mov r1, #0x3
    bl func_02067280
    ldmia sp!, {r4, pc}
.L_d0:
    mov r0, r4
    mov r1, #0x1
    bl func_02067280
    ldmia sp!, {r4, pc}
.L_e0:
    subs r1, r0, #0x64
    ldmmiia sp!, {r4, pc}
    cmp r1, #0x9a
    ldmgeia sp!, {r4, pc}
    mov r0, #0xc
    mul r2, r1, r0
    ldr r0, _LIT0
    ldrb r0, [r0, r2]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, _LIT1
    ldrb r0, [r0, r2]
    cmp r0, #0x0
    beq .L_12c
    ldr r1, _LIT2
    mov r0, r4
    ldr r1, [r1, r2]
    bl func_02067220
    ldmia sp!, {r4, pc}
.L_12c:
    ldr r1, _LIT2
    mov r0, r4
    ldr r1, [r1, r2]
    ldr r1, [r1]
    bl func_02067280
    ldmia sp!, {r4, pc}
_LIT0: .word data_0219dbd4
_LIT1: .word data_0219dbd5
_LIT2: .word data_0219dbdc
