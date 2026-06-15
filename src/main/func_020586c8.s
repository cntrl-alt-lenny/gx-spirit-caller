; func_020586c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100350
        .extern data_02100364
        .extern data_0210036c
        .extern func_020453b4
        .extern func_02054e54
        .extern func_02054e70
        .extern func_02057980
        .extern func_02058038
        .extern func_02058070
        .extern func_0205888c
        .extern func_0205bd58
        .extern func_0205cab4
        .extern func_0205d560
        .global func_020586c8
        .arm
func_020586c8:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r5, r0
    ldr r4, [r5]
    ldr r2, [r4, #0x1d8]
    cmp r2, #0x4
    addeq sp, sp, #0x10
    ldmeqia sp!, {r4, r5, r6, pc}
    cmp r2, #0x0
    beq .L_714
    cmp r1, #0x0
    beq .L_68c
    cmp r2, #0x3
    bne .L_68c
    ldr r2, _LIT0
    add r1, r4, #0x1f4
    bl func_02058070
    ldr r2, [r4, #0x198]
    mov r0, r5
    add r1, r4, #0x1f4
    bl func_02058038
    ldr r2, _LIT1
    mov r0, r5
    add r1, r4, #0x1f4
    bl func_02058070
.L_68c:
    mov r1, #0x1
    ldr r0, _LIT2
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r1, [r4, #0x1d4]
    add r3, sp, #0x8
    mov r0, r5
    add r2, r4, #0x1f4
    bl func_02057980
    ldr r0, [r4, #0x1d4]
    mvn r1, #0x0
    cmp r0, r1
    beq .L_6d8
    mov r1, #0x2
    bl func_02054e54
    ldr r0, [r4, #0x1d4]
    bl func_02054e70
    mvn r0, #0x0
    str r0, [r4, #0x1d4]
.L_6d8:
    ldr r0, [r4, #0x204]
    mvn r1, #0x0
    cmp r0, r1
    beq .L_700
    mov r1, #0x2
    bl func_02054e54
    ldr r0, [r4, #0x204]
    bl func_02054e70
    mvn r0, #0x0
    str r0, [r4, #0x204]
.L_700:
    mov r0, #0x4
    str r0, [r4, #0x1d8]
    mov r0, #0x0
    str r0, [r4, #0x19c]
    str r0, [r4, #0x1a0]
.L_714:
    ldr r0, [r4, #0x1dc]
    bl func_020453b4
    mov r0, #0x0
    str r0, [r4, #0x1dc]
    ldr r0, [r4, #0x1ec]
    bl func_020453b4
    mov r0, #0x0
    str r0, [r4, #0x1ec]
    ldr r0, [r4, #0x1f4]
    bl func_020453b4
    mov r0, #0x0
    str r0, [r4, #0x1f4]
    ldr r0, [r4, #0x440]
    bl func_020453b4
    mov r0, #0x0
    str r0, [r4, #0x440]
    ldr r0, [r4, #0x450]
    bl func_020453b4
    mov r0, #0x0
    str r0, [r4, #0x450]
    ldr r1, [r4, #0x424]
    cmp r1, #0x0
    beq .L_784
.L_770:
    mov r0, r5
    bl func_0205bd58
    ldr r1, [r4, #0x424]
    cmp r1, #0x0
    bne .L_770
.L_784:
    mov r0, #0x0
    str r0, [r4, #0x424]
    ldr r6, [r4, #0x434]
    cmp r6, #0x0
    beq .L_7b0
.L_798:
    mov r1, r6
    ldr r6, [r6, #0x3c]
    mov r0, r5
    bl func_0205cab4
    cmp r6, #0x0
    bne .L_798
.L_7b0:
    mov r6, #0x0
    str r6, [r4, #0x434]
    ldr r4, _LIT3
.L_7bc:
    mov r0, r5
    mov r1, r4
    mov r2, r6
    bl func_0205d560
    cmp r0, #0x0
    beq .L_7bc
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02100350
_LIT1: .word data_02100364
_LIT2: .word data_0210036c
_LIT3: .word func_0205888c
