import 'package:flutter/material.dart';
import '../models/components/topnavbar.dart'; // Import the TopNavbar

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNavbar(), // Use the TopNavbar in the appBar
      body: Container(
        color: Colors.white, // Set background color of the page to white
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // User Info Section
            _buildUserInfo(),
            const SizedBox(height: 20),

            // Preferences Section
            _buildPreferencesSection(),

            const Divider(),

            // Account Management Section
            _buildAccountManagementSection(),

            const Divider(),

            // Additional Information Section
            _buildAdditionalInfoSection(),

            const Divider(),

            // Account Actions Section
            _buildAccountActionsSection(),

            const Divider(),

            // Contact Information Section
            _buildContactInfoSection(),

            const Divider(),

            // Security Settings Section
            _buildSecuritySettingsSection(),

            const Divider(),

            // Notification Preferences Section
            _buildNotificationPreferencesSection(),

            const Divider(),

            // Linked Accounts Section
            _buildLinkedAccountsSection(),
          ],
        ),
      ),
    );
  }

  // User Info Section - Displays User Name and Email
  Widget _buildUserInfo() {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey[300],
          child: Icon(Icons.person, size: 40, color: Colors.black),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'User Name', // Replace with dynamic user name
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              'user@example.com', // Replace with dynamic email
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }

  // Preferences Section - Includes Dark Mode
  Widget _buildPreferencesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Preferences',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ListTile(
          leading: const Icon(Icons.brightness_6),
          title: const Text('Dark Mode'),
          trailing: Switch(
            value: true, // Replace with actual dark mode state
            onChanged: (bool value) {
              // Handle dark mode toggle
            },
          ),
        ),
      ],
    );
  }

  // Account Management Section - Includes Account Info and Billing
  Widget _buildAccountManagementSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Account Management',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ListTile(
          leading: const Icon(Icons.account_circle),
          title: const Text('Account Information'),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {
            // Handle navigation to account info page
          },
        ),
        ListTile(
          leading: const Icon(Icons.credit_card),
          title: const Text('Billing'),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {
            // Handle navigation to billing page
          },
        ),
      ],
    );
  }

  // Additional Information Section - Includes About Us and Privacy
  Widget _buildAdditionalInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'More Information',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ListTile(
          leading: const Icon(Icons.info),
          title: const Text('About Us'),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {
            // Handle navigation to about us page
          },
        ),
        ListTile(
          leading: const Icon(Icons.security),
          title: const Text('Privacy'),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {
            // Handle navigation to privacy page
          },
        ),
      ],
    );
  }

  // Account Actions Section - Includes Logout
  Widget _buildAccountActionsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Account Actions',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ListTile(
          leading: const Icon(Icons.exit_to_app),
          title: const Text('Logout'),
          onTap: () {
            // Handle logout action
          },
        ),
      ],
    );
  }

  // Contact Information Section
  Widget _buildContactInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Contact Information',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ListTile(
          leading: const Icon(Icons.phone),
          title: const Text('Phone Number'),
          subtitle: const Text('+1234567890'),
          trailing: const Icon(Icons.edit),
          onTap: () {
            // Handle editing phone number
          },
        ),
        ListTile(
          leading: const Icon(Icons.email),
          title: const Text('Email Address'),
          subtitle: const Text('user@example.com'),
          trailing: const Icon(Icons.edit),
          onTap: () {
            // Handle editing email address
          },
        ),
      ],
    );
  }

  // Security Settings Section
  Widget _buildSecuritySettingsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Security Settings',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ListTile(
          leading: const Icon(Icons.lock),
          title: const Text('Change Password'),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {
            // Handle password change
          },
        ),
        ListTile(
          leading: const Icon(Icons.fingerprint),
          title: const Text('Enable Fingerprint'),
          trailing: const Icon(Icons.check_box_outline_blank),
          onTap: () {
            // Handle fingerprint enable action
          },
        ),
      ],
    );
  }

  // Notification Preferences Section
  Widget _buildNotificationPreferencesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Notification Preferences',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ListTile(
          leading: const Icon(Icons.notifications),
          title: const Text('Email Notifications'),
          trailing: Switch(
            value: true, // Replace with actual email notification state
            onChanged: (bool value) {
              // Handle email notifications toggle
            },
          ),
        ),
        ListTile(
          leading: const Icon(Icons.notifications_active),
          title: const Text('SMS Notifications'),
          trailing: Switch(
            value: false, // Replace with actual SMS notification state
            onChanged: (bool value) {
              // Handle SMS notifications toggle
            },
          ),
        ),
      ],
    );
  }

  // Linked Accounts Section
  Widget _buildLinkedAccountsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Linked Accounts',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ListTile(
          leading: const Icon(Icons.account_circle),
          title: const Text('Google Account'),
          trailing: const Icon(Icons.check_circle),
          onTap: () {
            // Handle navigation or unlinking Google account
          },
        ),
        ListTile(
          leading: const Icon(Icons.account_balance_wallet),
          title: const Text('Facebook Account'),
          trailing: const Icon(Icons.check_circle),
          onTap: () {
            // Handle navigation or unlinking Facebook account
          },
        ),
      ],
    );
  }
}
