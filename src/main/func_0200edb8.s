; func_0200edb8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_02186ae8
        .extern func_0200ade8
        .extern func_0200da18
        .extern func_0201083c
        .global func_0200edb8
        .arm
func_0200edb8:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r2, [r1, #0x8]
    str r2, [r4, #0x26c]
    ldr r1, [r1, #0x10]
    str r1, [r4, #0x270]
    ldr r1, [r4, #0x18]
    cmp r1, #0x0
    beq .L_4c
    bl func_0201083c
    cmp r0, #0x0
    bne .L_4c
    mov r1, r4
    mov r0, #0x0
    mov r2, #0x284
    bl Fill32
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_4c:
    ldr r1, [r4, #0x60]
    mov r0, #0x1000
    bic r1, r1, #0x1
    orr r1, r1, #0x5
    str r1, [r4, #0x60]
    str r0, [r4, #0x48]
    str r0, [r4, #0x4c]
    str r0, [r4, #0x50]
    ldr r1, _LIT1
    ldr r0, _LIT2
    str r1, [r4, #0x54]
    str r0, [r4, #0x58]
    mov r2, r4
    str r4, [r4, #0x5c]
    mov r1, #0x0
    mvn r0, #0x0
.L_8c:
    add r1, r1, #0x1
    str r0, [r2, #0xdc]
    cmp r1, #0x8
    add r2, r2, #0x24
    blt .L_8c
    mov r2, #0x0
    mvn r1, #0x0
.L_a8:
    add r0, r4, r2, lsl #0x4
    add r2, r2, #0x1
    str r1, [r0, #0x1e8]
    cmp r2, #0x8
    blt .L_a8
    str r1, [r4, #0x6c]
    str r1, [r4, #0x70]
    str r1, [r4, #0x74]
    mov r0, #0x0
    str r0, [r4, #0x78]
    ldr r1, [r4, #0x7c]
    mov r0, r4
    orr r1, r1, #0x20000000
    str r1, [r4, #0x7c]
    ldmia sp!, {r4, pc}
_LIT0: .word data_02186ae8
_LIT1: .word func_0200da18
_LIT2: .word func_0200ade8
