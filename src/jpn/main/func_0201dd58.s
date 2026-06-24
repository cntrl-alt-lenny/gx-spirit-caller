; func_0201dd58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0201dd58
        .arm
func_0201dd58:
    stmdb sp!, {r3, lr}
    ldr r3, [r0, #0x1c]
    mov lr, #0x0
    mov ip, r3, lsl #0x18
    mov ip, ip, lsr #0x18
    cmp ip, #0x20
    movhi r3, r3, lsl #0x10
    movhi r3, r3, lsr #0x18
    cmphi r3, #0x20
    bls .L_684
    cmp r1, #0x20
    cmpge r2, #0x20
    movge lr, #0x1800
    bge .L_6b4
    cmp r1, #0x20
    movge lr, #0x800
    bge .L_6b4
    cmp r2, #0x20
    movge lr, #0x1000
    b .L_6b4
.L_684:
    cmp ip, #0x20
    bls .L_698
    cmp r1, #0x20
    movge lr, #0x800
    b .L_6b4
.L_698:
    ldr r0, [r0, #0x1c]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x18
    cmp r0, #0x20
    bls .L_6b4
    cmp r2, #0x20
    movge lr, #0x800
.L_6b4:
    mov r0, lr
    ldmia sp!, {r3, pc}
