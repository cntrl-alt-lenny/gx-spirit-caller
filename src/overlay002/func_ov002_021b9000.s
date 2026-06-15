; func_ov002_021b9000 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1ac
        .extern func_0202e270
        .global func_ov002_021b9000
        .arm
func_ov002_021b9000:
    stmdb sp!, {r3, lr}
    ldr r2, _LIT0
    and ip, r0, #0x1
    mov r0, #0x14
    mul r3, ip, r2
    ldr ip, _LIT1
    mul r2, r1, r0
    add r0, ip, r3
    add r0, r0, r2
    ldr r0, [r0, #0x30]
    ldr ip, _LIT2
    mov r0, r0, lsl #0x13
    cmp ip, r0, lsr #0x13
    mov r0, r0, lsr #0x13
    blt .L_54
    cmp r0, ip
    bge .L_74
    sub r1, ip, #0xf9
    cmp r0, r1
    beq .L_74
    b .L_8c
.L_54:
    add r1, ip, #0xda
    cmp r0, r1
    bgt .L_68
    beq .L_74
    b .L_8c
.L_68:
    ldr r1, _LIT3
    cmp r0, r1
    bne .L_8c
.L_74:
    ldr r0, _LIT4
    add r0, r0, r3
    ldr r0, [r2, r0]
    mov r0, r0, lsr #0xa
    and r0, r0, #0x1
    ldmia sp!, {r3, pc}
.L_8c:
    bl func_0202e270
    ldmia sp!, {r3, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x0000172f
_LIT3: .word 0x00001aca
_LIT4: .word data_ov002_022cf1ac
