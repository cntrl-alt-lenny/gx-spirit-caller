; func_0200f044 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0200f044
        .arm
func_0200f044:
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    ldrne ip, [r0, #0x80]
    cmpne ip, #0x0
    beq .L_378
    ldr ip, [r0, #0x84]
    mov r3, r3, lsl #0x1f
    bic ip, ip, #0x1
    orr lr, ip, #0x1
    bic ip, lr, #0x20
    orr r3, ip, r3, lsr #0x1a
    str r3, [r0, #0x84]
    cmp r1, #0x6
    addls pc, pc, r1, lsl #0x2
    b .L_370
    b .L_2e4
    b .L_31c
    b .L_334
    b .L_34c
    b .L_360
    b .L_300
    b .L_2e8
.L_2e4:
    mov r2, #0x0
.L_2e8:
    ldr r3, [r0, #0x84]
    ldr r1, _LIT0
    mov r2, r2, lsl #0x10
    and r1, r3, r1
    orr r1, r1, r2, lsr #0xa
    str r1, [r0, #0x84]
.L_300:
    ldr r1, [r0, #0x84]
    bic r1, r1, #0x2
    bic r2, r1, #0x4
    bic r1, r2, #0x8
    bic r1, r1, #0x10
    str r1, [r0, #0x84]
    b .L_370
.L_31c:
    ldr r1, [r0, #0x84]
    orr r2, r1, #0x2
    bic r1, r2, #0x4
    bic r1, r1, #0x10
    str r1, [r0, #0x84]
    b .L_370
.L_334:
    ldr r1, [r0, #0x84]
    orr r2, r1, #0x4
    bic r1, r2, #0x2
    bic r1, r1, #0x8
    str r1, [r0, #0x84]
    b .L_370
.L_34c:
    ldr r1, [r0, #0x84]
    orr r1, r1, #0x8
    bic r1, r1, #0x4
    str r1, [r0, #0x84]
    b .L_370
.L_360:
    ldr r1, [r0, #0x84]
    orr r1, r1, #0x10
    bic r1, r1, #0x2
    str r1, [r0, #0x84]
.L_370:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_378:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word 0xffc0003f
