; func_0204706c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219daec
        .extern func_02045280
        .extern func_02045678
        .extern func_020459c4
        .extern func_020466f4
        .extern func_020480b4
        .extern func_0205396c
        .extern func_0209448c
        .extern func_020944a4
        .global func_0204706c
        .arm
func_0204706c:
    stmdb sp!, {r4, r5, r6, lr}
    movs r4, r0
    mov r6, r2
    mov r5, r3
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    bl func_02045280
    cmp r0, #0x0
    bne .L_41c
    ldr r0, _LIT0
    ldr r2, [r0]
    ldr r1, [r2, #0x24]
    cmp r1, #0x0
    beq .L_424
.L_41c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_424:
    str r6, [r2, #0x70]
    ldr r1, [r0]
    cmp r4, #0x0
    str r5, [r1, #0x74]
    beq .L_444
    ldrh r1, [r4]
    cmp r1, #0x0
    bne .L_44c
.L_444:
    mov r5, #0x0
    b .L_498
.L_44c:
    ldr r1, [r0]
    mov r0, #0x0
    add r1, r1, #0x2e
    mov r2, #0x34
    bl func_0209448c
    mov r0, r4
    bl func_020459c4
    cmp r0, #0x19
    movhi r5, #0x19
    bhi .L_480
    mov r0, r4
    bl func_020459c4
    mov r5, r0
.L_480:
    ldr r1, _LIT0
    mov r0, r4
    ldr r1, [r1]
    mov r2, r5, lsl #0x1
    add r1, r1, #0x2e
    bl func_020944a4
.L_498:
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    add r0, r0, r5, lsl #0x1
    strh r1, [r0, #0x2e]
    bl func_02045678
    cmp r0, #0x4
    beq .L_4cc
    ldr r1, _LIT1
    mov r0, #0x2
    bl func_020480b4
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_4cc:
    mov r0, #0x1
    bl func_020466f4
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x68]
    bl func_0205396c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0219daec
_LIT1: .word 0xffff1596
