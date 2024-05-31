# elBigay

## Group Details

    CMSC 23 U-2L Group "Group Name"

    Developers:
        William Nathan Abellanida
        Adrian Jericho Javier
        Cyrene Myndie S. Labiano

## Program Description

elBigay is a comprehensive solution designed to facilitate and streamline the process of donating various items to charitable organizations. It is an android mobile application built using Flutter for cross-platform compatibility and Firebase for robust backend support. The app features three types of users: Donor, Organization, and Admin. Each user type has distinct roles and functionalities to ensure a seamless donation process.

## Installation Guide

    1. Open terminal.
    2. Make sure that you are on the base folder of your flutter app.
    3. Run `flutter pub get` to get all dependencies needed
    4. Run `flutter build apk --release` to build the apk
    5. Once the command has finished running, the terminal will show a path where you can find your apk.
    6. Download the apk on your phone.
    7. You can now start using the app.

## Getting Started

### Registration

**Donors**

1. Open the app and select "Sign up"
2. Choose Donor.
3. Fill in the required details: name, email, password, and any other necessary information.
4. Click "Sign Up"

**Organizations**

1. Open the app and select "Sign up"
2. Fill in the required details: organization name, email, password, and additional organization information.
3. Click "Sign up"
4. Wait for admin approval. You may use the app once admin has approved your registration.

**Admin**

1. Admin accounts are created by the system administrator. Contact support if you require an admin account.

### Logging In

1. Open the app and select "Sign in"
2. Enter your username and password.
3. Click "Sign in"

## Donor Guide

**Viewing Donation Drives**

1. After logging in, navigate to the "Home" section.
2. Browse through the list of active organizations.
3. Click on an organization to view more details.

**Making a Donation**

1. After viewing an organization, click "Donate".
2. Fill out the donation form with the required details (type of donation, weight, etc.)
3. Choose your mode of donation: "Pickup" or "Drop-off"
4. Click "Donate"

**Tracking Donation Status**

1. Navigate to the "Donations" section.
2. View the status of each donation:
   - Pending: Your donation hasn't been confirmed by the organization.
   - Confirmed: Your donation has been confirmed by the organization.
   - Scheduled for Pickup/Drop-off: The organization has scheduled your donation for pickup or drop-off.
   - Completed: Your donation has been received and processed by the organization.

**Cancelling a Donation**

1. Go to the "Donations" section.
2. Select the donation you want to cancel.
3. Click "Cancel Donation"

**Generating a QR Code for Drop-off**

1. After selecting "Drop off" as your mode of donation, a QR code will be generated.
2. Show this QR code to the organization when you drop off your donation.
3. The organization will scan the QR code to complete the donation process.

## Organization Guide

**Creating a Donation Drive**

1. Log in to your approved organization account.
2. Navigate to the "Donation Drives" section.
3. Click the floating button with "+" icon to open create new donation drive form.
4. Fill out the details for the new donation drive (title, description, etc.).
5. Click "Create"

**Managing Donations**

1. Go to the "Home" section.
2. View the list of donations in different status (pending, confirmed, etc.)
3. Open a donation and click "Link to Donation Drive"
4. Complete Donation: Mark the donation as completed after receipt.

**Scanning QR Codes**

1. For drop-off donations, navigate to the "Home" section.
2. Use your device's camera to scan the donor's QR code.
3. The donation status will automatically update to "Completed."

## Admin Guide

**Approving Organizations**

1. Log in to your admin account.
2. Navigate to the "For Approval" section.
3. Review the details of the organization registration requests.
4. Approve or reject each re

**Viewing Users**

1. Go to the "Users" section to view all registered donors and organizations.

**View Donations**

1. Navigate to the "Donations" section to see all donations made through the app
