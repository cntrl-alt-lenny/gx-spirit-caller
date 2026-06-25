; func_02089330 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern data_021a5720
        .global func_02089330
        .arm
func_02089330:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    mov r4, r1
    mov r0, r4
    mov r1, r5
    mov r2, #0x30
    bl Copy32
    ldr r0, [r5, #0x18]
    mov ip, #0x0
    cmp r0, #0x0
    moveq r0, #0x0
    addne r0, r4, r0
    str r0, [r5, #0x8c]
    ldr r0, [r5, #0x20]
    cmp r0, #0x0
    moveq r0, #0x0
    addne r0, r4, r0
    str r0, [r5, #0x84]
    ldr r0, [r5, #0x10]
    cmp r0, #0x0
    moveq r0, #0x0
    addne r0, r4, r0
    str r0, [r5, #0x88]
    ldr r2, [r5, #0x84]
    ldr r0, [r2, #0x8]
    cmp r0, #0x0
    bls .L_ac
    mov r3, ip
    mov r1, ip
.L_78:
    add r2, r2, #0xc
    ldr r0, [r2, r3]
    add r2, r2, r3
    cmp r0, #0x0
    moveq r0, r1
    addne r0, r4, r0
    str r0, [r2, #0x8]
    ldr r2, [r5, #0x84]
    add ip, ip, #0x1
    ldr r0, [r2, #0x8]
    add r3, r3, #0x10
    cmp ip, r0
    bcc .L_78
.L_ac:
    mov r1, #0x0
    ldr r0, _LIT0
    str r1, [r5, #0x30]
    str r5, [r0]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_021a5720
