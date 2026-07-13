; func_ov015_021b2414 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov015_021b2414
        .arm
func_ov015_021b2414:
    stmdb sp!, {r3, lr}
    cmp r1, #0x0
    beq .L_20
    cmp r1, #0x1
    beq .L_3c
    cmp r1, #0x2
    beq .L_58
    ldmia sp!, {r3, pc}
.L_20:
    strh r2, [r0, #0x3c]
    strh r3, [r0, #0x3e]
    add r1, r2, #0x18
    strh r1, [r0, #0x40]
    add r1, r3, #0x14
    strh r1, [r0, #0x42]
    ldmia sp!, {r3, pc}
.L_3c:
    strh r2, [r0, #0x44]
    strh r3, [r0, #0x46]
    add r1, r2, #0x18
    strh r1, [r0, #0x48]
    add r1, r3, #0x14
    strh r1, [r0, #0x4a]
    ldmia sp!, {r3, pc}
.L_58:
    ldrsh r1, [r0, #0x46]
    ldrsh lr, [r0, #0x42]
    ldrsh ip, [r0, #0x48]
    ldrsh r2, [r0, #0x3c]
    add r3, r1, #0x4
    mov r1, #0x0
    strh r2, [r0, #0x34]
    strh lr, [r0, #0x36]
    strh ip, [r0, #0x38]
    strh r3, [r0, #0x3a]
    ldrsh ip, [r0, #0x3c]
    ldrsh r3, [r0, #0x42]
    add r2, ip, #0x18
    strh ip, [r0, #0x4c]
    strh r3, [r0, #0x4e]
    strh r2, [r0, #0x50]
    add r2, r3, #0x15
    strh r2, [r0, #0x52]
    ldrsh r3, [r0, #0x46]
    ldrsh ip, [r0, #0x44]
    sub r2, r3, #0x11
    strh ip, [r0, #0x54]
    strh r2, [r0, #0x56]
    add r2, ip, #0x18
    strh r2, [r0, #0x58]
    add r2, r3, #0x4
    strh r2, [r0, #0x5a]
    str r1, [r0, #0x4]
    ldrsh r2, [r0, #0x56]
    ldrsh r1, [r0, #0x4e]
    sub r1, r2, r1
    str r1, [r0, #0x8]
    ldrsh r1, [r0, #0x4e]
    str r1, [r0, #0x10]
    ldmia sp!, {r3, pc}
