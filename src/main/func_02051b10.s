; func_02051b10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dcb4
        .extern data_0219dcb5
        .extern data_0219dcb6
        .extern data_0219dcb8
        .extern data_0219dcbc
        .extern func_0204548c
        .extern func_020454cc
        .extern func_0204b3d0
        .extern func_02050054
        .extern func_02067850
        .extern func_020aaddc
        .extern func_020aadf8
        .extern func_020aaf40
        .global func_02051b10
        .arm
func_02051b10:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    movs r6, r1
    mov r7, r0
    mov r5, r2
    beq .L_7c
    cmp r5, #0x0
    bne .L_84
.L_7c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_84:
    cmp r7, #0x64
    bcc .L_cc
    sub r2, r7, #0x64
    mov r0, #0xc
    mul r3, r2, r0
    ldr r0, _LIT0
    ldrb r0, [r0, r3]
    cmp r0, #0x0
    beq .L_cc
    ldr r0, _LIT1
    ldr r0, [r0, r3]
    cmp r0, #0x0
    beq .L_dc
    bl func_020aaf40
    cmp r0, #0x0
    beq .L_dc
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_cc:
    bl func_0204b3d0
    movs r7, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
.L_dc:
    sub r1, r7, #0x64
    mov r0, #0xc
    mul r4, r1, r0
    ldr r1, _LIT0
    ldr r0, _LIT2
    strb r7, [r1, r4]
    mov r2, #0x1
    ldr r1, _LIT3
    strb r2, [r0, r4]
    mov r2, #0x0
    ldr r0, _LIT1
    strh r2, [r1, r4]
    ldr r1, [r0, r4]
    cmp r1, #0x0
    beq .L_120
    mov r0, #0x4
    bl func_0204548c
.L_120:
    mov r0, r6
    ldr r8, _LIT1
    bl func_020aaddc
    add r1, r0, #0x1
    mov r0, #0x4
    bl func_020454cc
    str r0, [r8, r4]
    ldr r0, [r8, r4]
    cmp r0, #0x0
    bne .L_15c
    ldr r1, _LIT4
    mov r0, #0x9
    bl func_02050054
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_15c:
    mov r1, r6
    bl func_020aadf8
    ldr r1, _LIT5
    mov r0, r8
    str r5, [r1, r4]
    ldr r1, [r0, r4]
    mov r0, r7
    bl func_02067850
    mov r0, r7
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_0219dcb4
_LIT1: .word data_0219dcb8
_LIT2: .word data_0219dcb5
_LIT3: .word data_0219dcb6
_LIT4: .word 0xfffec77f
_LIT5: .word data_0219dcbc
