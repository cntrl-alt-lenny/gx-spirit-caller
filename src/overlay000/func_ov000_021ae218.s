; func_ov000_021ae218 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104bac
        .extern data_ov000_021c75c4
        .extern func_02001e5c
        .extern func_02001e84
        .extern func_02006164
        .extern func_02037208
        .global func_ov000_021ae218
        .arm
func_ov000_021ae218:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldrh r0, [r0, #0x54]
    tst r0, #0x1
    bne .L_4f8
    bl func_02006164
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
.L_4f8:
    ldr r0, [r4, #0x270]
    mov r1, r0, lsl #0x14
    movs r1, r1, lsr #0x1f
    beq .L_558
    mov r0, r0, lsl #0x16
    movs r0, r0, lsr #0x1f
    bne .L_558
    add r0, r4, #0x1ac
    bl func_02001e84
    cmp r0, #0x0
    bne .L_534
    add r0, r4, #0x1ac
    bl func_02001e5c
    cmp r0, #0x0
    beq .L_558
.L_534:
    ldr r0, [r4, #0x270]
    mov r0, r0, lsl #0x15
    movs r0, r0, lsr #0x1f
    bne .L_558
    mov r0, #0x9b
    sub r1, r0, #0x9c
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_558:
    ldr r1, [r4, #0x270]
    add r0, r4, #0x1ac
    orr r1, r1, #0x200
    str r1, [r4, #0x270]
    bl func_02001e5c
    cmp r0, #0x0
    ldrne r0, [r4, #0x270]
    bicne r0, r0, #0x800
    strne r0, [r4, #0x270]
    ldmia sp!, {r4, pc}
_LIT0: .word data_02104bac
_LIT1: .word data_ov000_021c75c4
