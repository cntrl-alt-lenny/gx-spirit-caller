; func_0205c3c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100b54
        .extern data_02100b64
        .extern data_02100ba4
        .extern data_02100bb4
        .extern data_02100bb8
        .extern data_02100bc0
        .extern func_0205407c
        .extern func_02054b9c
        .extern func_02058038
        .extern func_02058070
        .extern func_020580a0
        .extern func_020581a8
        .extern func_020a6d54
        .extern func_020aaddc
        .global func_0205c3c0
        .arm
func_0205c3c0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x18
    movs r7, r1
    mov r8, r0
    mov r6, r2
    mov r5, r3
    bne .L_1524
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x340
    bl func_020a6d54
.L_1524:
    cmp r5, #0x0
    bne .L_1540
    ldr r0, _LIT2
    ldr r1, _LIT1
    ldr r3, _LIT3
    mov r2, #0x0
    bl func_020a6d54
.L_1540:
    mov r0, r5
    bl func_020aaddc
    add r1, sp, #0x0
    mov r2, #0x0
    str r2, [r1]
    str r2, [r1, #0x4]
    str r2, [r1, #0x8]
    str r2, [r1, #0xc]
    str r2, [r1, #0x10]
    str r2, [r1, #0x14]
    mov r4, r0
    ldr r2, _LIT4
    mov r0, r8
    str r6, [sp, #0x10]
    bl func_02058070
    cmp r0, #0x0
    addne sp, sp, #0x18
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    add r1, sp, #0x0
    mov r0, r8
    mov r2, r6
    bl func_02058038
    cmp r0, #0x0
    addne sp, sp, #0x18
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r2, _LIT5
    add r1, sp, #0x0
    mov r0, r8
    bl func_02058070
    cmp r0, #0x0
    addne sp, sp, #0x18
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    add r1, sp, #0x0
    mov r0, r8
    mov r2, r4
    bl func_02058038
    cmp r0, #0x0
    addne sp, sp, #0x18
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r2, _LIT6
    add r1, sp, #0x0
    mov r0, r8
    bl func_02058070
    cmp r0, #0x0
    addne sp, sp, #0x18
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr ip, [sp, #0x8]
    add r1, sp, #0x0
    mov r0, r8
    mov r2, r5
    mov r3, r4
    str ip, [sp, #0x14]
    bl func_020580a0
    cmp r0, #0x0
    addne sp, sp, #0x18
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    add r1, sp, #0x0
    mov r0, r8
    mov r2, #0x0
    bl func_020581a8
    cmp r0, #0x0
    addne sp, sp, #0x18
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, [r7, #0x38]
    add r1, sp, #0x0
    bl func_0205407c
    mov r0, #0x0
    bl func_02054b9c
    add r0, r0, #0x12c
    str r0, [r7, #0x10]
    mov r0, #0x0
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_02100b54
_LIT1: .word data_02100b64
_LIT2: .word data_02100ba4
_LIT3: .word 0x00000341
_LIT4: .word data_02100bb4
_LIT5: .word data_02100bb8
_LIT6: .word data_02100bc0
