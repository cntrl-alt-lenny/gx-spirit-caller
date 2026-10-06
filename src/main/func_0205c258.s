; func_0205c258 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100b54
        .extern data_02100b64
        .extern data_02100b70
        .extern func_02054b9c
        .extern func_02057d2c
        .extern func_02057d5c
        .extern func_02057e60
        .extern func_020a6d54
        .extern func_020a978c
        .extern func_020aaddc
        .global func_0205c258
        .arm
func_0205c258:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x24
    movs r6, r1
    mov r7, r0
    mov r5, r2
    mov r4, r3
    bne .L_30
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r3, _LIT2
    mov r2, #0x0
    bl func_020a6d54
.L_30:
    mvn r0, #0x0
    cmp r5, #0x0
    ldreq r5, _LIT3
    cmp r4, r0
    bne .L_50
    mov r0, r5
    bl func_020aaddc
    mov r4, r0
.L_50:
    ldr r1, _LIT4
    add r0, sp, #0x0
    mov r2, r4
    bl func_020a978c
    add r2, sp, #0x0
    mov r0, r7
    mov r1, r6
    bl func_02057d2c
    cmp r0, #0x0
    addne sp, sp, #0x24
    ldmneia sp!, {r4, r5, r6, r7, pc}
    mov r0, r7
    mov r1, r6
    mov r2, r5
    mov r3, r4
    bl func_02057d5c
    cmp r0, #0x0
    addne sp, sp, #0x24
    ldmneia sp!, {r4, r5, r6, r7, pc}
    mov r0, r7
    mov r1, r6
    mov r2, #0x0
    bl func_02057e60
    cmp r0, #0x0
    addne sp, sp, #0x24
    ldmneia sp!, {r4, r5, r6, r7, pc}
    mov r0, #0x0
    bl func_02054b9c
    add r0, r0, #0x12c
    str r0, [r6, #0x10]
    mov r0, #0x0
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_02100b54
_LIT1: .word data_02100b64
_LIT2: .word 0x00000389
_LIT3: .word data_02100b70
_LIT4: .word data_02100b70+0x4
