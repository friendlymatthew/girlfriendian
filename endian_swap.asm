.align 4
.global _endian_swap


_endian_swap:                   // w0, w1 two registers
                                // w0 = 0x12345678
    ror w1, w0, 8               // w1 = 0x78123456
    and w1, w1, #0xFF00FF00     // w1 = 0x78003400

    ror w0, w0, 24              // w0 = 0x34567812
    and w0, w0, #0x00FF00FF     // w0 = 0x00560012

    orr w0, w0, w1              // w0 = 0x78563412

    ret


_endian_swap_four_registers:   // w0, w1, w2, w3 four registers
                                // w0 = 0x12345678
    lsr w1, w0, 24              // w1 = 0x00000012
    and w1, w1, #0xFF           // w1 = 0x00000012

    lsr w2, w0, 8               // w2 = 0x00123456
    and w2, w2, #0xFF00         // w2 = 0x00003400

    lsl w3, w0, 8               // w3 =  0x34567800
    and w3, w3, #0xFF0000       // w3 = 0x00560000

    and w0, w0, #0x000000FF     // w0 = 0x00000078
    lsl w0, w0, 24              // w0 = 0x78000000

    // Combine the shifted bytes
    orr w0, w0, w1
    orr w0, w0, w2
    orr w0, w0, w3

    ret


_endian_swap_five_registers:        // w0, w1, w2, w3, w4 -- five registers
                                    // w0 = 12345678
    lsr w1, w0, 24                  // w1 = 00000012
    and w1, w1, #0xFF               // w1 = 00000012

    lsr w2, w0, 8                   // w2 = 00123456
    and w2, w2, #0xFF00             // w2 = 00003400

    lsl w3, w0, 8                   // w3 = 34567800
    and w3, w3, #0xFF0000            // w3 = 00560000

    lsr w4, w0, 24                  // w4 = 78000000
    and w4, w4, #0xFF000000          // W4 = 78000000

    orr w0, w0, w1
    orr w0, w0, w2
    orr w0, w0, w3
    orr w0, w0, w4

    ret