        .text
        .extern func_ov002_021b4098
        .global func_ov002_02204020
        .arm
func_ov002_02204020:
    ldrh r0, [r0, #0x2]
    ldr ip, .L_0220403c
    mov r1, #0xb
    mov r0, r0, lsl #0x1f
    mov r2, #0x14c0
    mov r0, r0, lsr #0x1f
    bx ip
.L_0220403c: .word func_ov002_021b4098
