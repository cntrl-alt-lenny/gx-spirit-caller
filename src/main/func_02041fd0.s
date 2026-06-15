; func_02041fd0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fe7f0
        .extern data_020fe9bc
        .extern data_020fe9c8
        .extern data_020fe9d0
        .extern data_020fe9d4
        .extern func_020416f8
        .extern func_0209150c
        .extern func_020aaddc
        .extern func_020ab0c4
        .global func_02041fd0
        .arm
func_02041fd0:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    ldr r1, _LIT0
    ldr r2, _LIT1
    mov r4, r0
    bl func_020416f8
    cmp r0, #0x0
    addne sp, sp, #0x8
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
    add r0, r4, #0x1000
    ldr r0, [r0, #0x9f4]
    ldr r1, _LIT2
    bl func_020ab0c4
    add r0, r0, #0x4
    bl func_020aaddc
    movs r3, r0
    beq .L_28c
    ldr r2, _LIT3
    add r0, sp, #0x0
    mov r1, #0x7
    bl func_0209150c
    ldr r1, _LIT4
    add r2, sp, #0x0
    mov r0, r4
    bl func_020416f8
    cmp r0, #0x0
    addne sp, sp, #0x8
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
.L_28c:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
_LIT0: .word data_020fe9bc
_LIT1: .word data_020fe9c8
_LIT2: .word data_020fe7f0
_LIT3: .word data_020fe9d0
_LIT4: .word data_020fe9d4
