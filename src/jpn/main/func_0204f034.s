; func_0204f034 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff8a0
        .extern data_020ff964
        .extern data_020ff970
        .extern data_0219dbb0
        .extern data_0219dbd4
        .extern func_0204987c
        .extern func_0204efcc
        .extern func_02068c64
        .extern func_02068d7c
        .extern func_0209150c
        .global func_0204f034
        .arm
func_0204f034:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x1b0
    mov r7, #0x8
    mov r6, #0xa
    mov r5, #0x32
    mov r4, #0x33
    mov r3, #0x34
    mov r2, #0x35
    mov r1, #0x36
    strb r7, [sp, #0x10c]
    strb r6, [sp, #0x10d]
    strb r5, [sp, #0x10e]
    strb r4, [sp, #0x10f]
    strb r3, [sp, #0x110]
    strb r2, [sp, #0x111]
    strb r1, [sp, #0x112]
    mov r5, r0
    mov r4, #0x7
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    beq .L_68
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x1
    bne .L_98
.L_68:
    add r1, sp, #0x100
    ldr r2, _LIT0
    add r1, r1, #0x13
    mov r3, #0x0
.L_78:
    ldrb r0, [r2]
    add r3, r3, #0x1
    add r2, r2, #0xc
    cmp r0, #0x0
    strneb r0, [r1], #0x1
    addne r4, r4, #0x1
    cmp r3, #0x9a
    blt .L_78
.L_98:
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_150
    b .L_150
    b .L_150
    b .L_130
    b .L_c4
    b .L_130
    b .L_130
.L_c4:
    bl func_0204987c
    ldr r0, [r0, #0x200]
    cmp r0, #0x0
    bne .L_128
    bl func_0204987c
    mov r6, r0
    bl func_0204987c
    mov r5, r0
    bl func_0204987c
    ldr r1, [r6, #0x1f8]
    ldrb r2, [r5, #0x16]
    ldrb r3, [r0, #0x15]
    add r0, sp, #0xc
    bl func_0204efcc
    ldr r0, _LIT1
    ldr r5, [r0]
    cmp r5, #0x0
    beq .L_150
    add r0, sp, #0xc
    ldr r2, _LIT2
    mov r3, r0
    mov r1, #0x100
    str r5, [sp]
    bl func_0209150c
    b .L_150
.L_128:
    bl func_0204987c
    ldr r5, [r0, #0x200]
.L_130:
    ldr r2, _LIT3
    ldr r3, _LIT4
    add r0, sp, #0xc
    mov r1, #0x100
    str r5, [sp]
    bl func_0209150c
    bl func_0204987c
    str r5, [r0, #0x1fc]
.L_150:
    bl func_0204987c
    ldr r0, [r0, #0xe4]
    bl func_02068c64
    mov sl, #0x0
    add r9, sp, #0xc
    add r5, sp, #0x10c
    mov r6, sl
    mov r8, #0x6
    mov r7, #0x1
.L_174:
    bl func_0204987c
    str r4, [sp]
    str r9, [sp, #0x4]
    str r8, [sp, #0x8]
    ldr r0, [r0, #0xe4]
    mov r1, r7
    mov r2, r6
    mov r3, r5
    bl func_02068d7c
    cmp r0, #0x0
    addeq sp, sp, #0x1b0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    cmp r0, #0x2
    addne sp, sp, #0x1b0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    add sl, sl, #0x1
    cmp sl, #0x5
    blt .L_174
    add sp, sp, #0x1b0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_0219dbd4
_LIT1: .word data_0219dbb0
_LIT2: .word data_020ff964
_LIT3: .word data_020ff970
_LIT4: .word data_020ff8a0
