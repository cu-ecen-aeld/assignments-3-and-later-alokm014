#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>

int main(int argc, char *argv[]) {
    // Check if number of arguments provided is not equal to 3
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <file> <string>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    // Assign command line arguments to variables
    const char *file = argv[1];
    const char *string = argv[2];

    // Open the file for writing
    FILE *fp = fopen(file, "w");
    if (fp == NULL) {
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }

    // Write the string to the file
    fprintf(fp, "%s", string);

    // Close the file
    fclose(fp);

    // Log the operation using syslog
    openlog("writer", LOG_PID | LOG_CONS, LOG_USER);
    syslog(LOG_DEBUG, "Writing '%s' to '%s'", string, file);
    closelog();

    printf("File '%s' created and written successfully.\n", file);

    return EXIT_SUCCESS;
}
