import 'package:flutter/material.dart';
import '../models/components/topnavbar.dart';
import 'package:mad_veloura/models/theme/theme_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isDarkMode = ThemeController().isDarkMode;

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    final isDark = _isDarkMode;

    return Scaffold(
      appBar: TopNavbar(),
      backgroundColor: isDark ? Colors.black : Colors.white,
      body: SingleChildScrollView(
        child: Container(
          color: isDark ? Colors.black : Colors.white,
          padding: const EdgeInsets.all(16.0),
          child: orientation == Orientation.portrait
              ? _buildPortraitLayout(isDark)
              : _buildLandscapeLayout(context, isDark),
        ),
      ),
    );
  }

  Widget _buildPortraitLayout(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _buildProfileSections(isDark),
    );
  }

  Widget _buildLandscapeLayout(BuildContext context, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _buildProfileSections(isDark),
    );
  }

  List<Widget> _buildProfileSections(bool isDark) {
    return [
      _buildUserInfo(isDark),
      const SizedBox(height: 20),
      _buildPreferencesSection(isDark),
      const Divider(),
      _buildAccountManagementSection(isDark),
      const Divider(),
      _buildAdditionalInfoSection(isDark),
      const Divider(),
      _buildAccountActionsSection(isDark),
      const Divider(),
      _buildContactInfoSection(isDark),
      const Divider(),
      _buildSecuritySettingsSection(isDark),
      const Divider(),
      _buildNotificationPreferencesSection(isDark),
      const Divider(),
      _buildLinkedAccountsSection(isDark),
    ];
  }

  Widget _buildUserInfo(bool isDark) {
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
          children: [
            Text(
              'User Name',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black),
            ),
            Text(
              'user@example.com',
              style: TextStyle(fontSize: 14, color: isDark ? Colors.white70 : Colors.grey),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPreferencesSection(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Preferences',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black),
        ),
        const SizedBox(height: 10),
        ListTile(
          leading: Icon(Icons.brightness_6, color: isDark ? Colors.white : Colors.black),
          title: Text('Dark Mode', style: TextStyle(color: isDark ? Colors.white : Colors.black)),
          trailing: Switch(
            value: _isDarkMode,
            onChanged: (bool value) {
              setState(() {
                _isDarkMode = value;
                ThemeController().set(value);
              });
            },
            activeColor: Color.fromARGB(255, 169, 121, 121),
          ),
        ),
      ],
    );
  }

  Widget _buildAccountManagementSection(bool isDark) {
    return _buildSectionWithTiles(isDark, 'Account Management', [
      _buildTile(Icons.account_circle, 'Account Information', isDark),
      _buildTile(Icons.credit_card, 'Billing', isDark),
    ]);
  }

  Widget _buildAdditionalInfoSection(bool isDark) {
    return _buildSectionWithTiles(isDark, 'More Information', [
      _buildTile(Icons.info, 'About Us', isDark),
      _buildTile(Icons.security, 'Privacy', isDark),
    ]);
  }

  Widget _buildAccountActionsSection(bool isDark) {
    return _buildSectionWithTiles(isDark, 'Account Actions', [
      ListTile(
        leading: Icon(Icons.exit_to_app, color: isDark ? Colors.white : Colors.black),
        title: Text('Logout', style: TextStyle(color: isDark ? Colors.white : Colors.black)),
        onTap: () {},
      ),
    ]);
  }

  Widget _buildContactInfoSection(bool isDark) {
    return _buildSectionWithTiles(isDark, 'Contact Information', [
      _buildSubtitleTile(Icons.phone, 'Phone Number', '+1234567890', isDark),
      _buildSubtitleTile(Icons.email, 'Email Address', 'user@example.com', isDark),
    ]);
  }

  Widget _buildSecuritySettingsSection(bool isDark) {
    return _buildSectionWithTiles(isDark, 'Security Settings', [
      _buildTile(Icons.lock, 'Change Password', isDark),
      _buildTile(Icons.fingerprint, 'Enable Fingerprint', isDark, trailing: Icon(Icons.check_box_outline_blank, color: isDark ? Colors.white : Colors.black)),
    ]);
  }

  Widget _buildNotificationPreferencesSection(bool isDark) {
    return _buildSectionWithTiles(isDark, 'Notification Preferences', [
      _buildSwitchTile(Icons.notifications, 'Email Notifications', true, isDark),
      _buildSwitchTile(Icons.notifications_active, 'SMS Notifications', false, isDark),
    ]);
  }

  Widget _buildLinkedAccountsSection(bool isDark) {
    return _buildSectionWithTiles(isDark, 'Linked Accounts', [
      _buildTile(Icons.account_circle, 'Google Account', isDark, trailing: Icon(Icons.check_circle, color: isDark ? Colors.white : Colors.black)),
      _buildTile(Icons.account_balance_wallet, 'Facebook Account', isDark, trailing: Icon(Icons.check_circle, color: isDark ? Colors.white : Colors.black)),
    ]);
  }

  Widget _buildSectionWithTiles(bool isDark, String title, List<Widget> tiles) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black)),
        const SizedBox(height: 10),
        ...tiles,
      ],
    );
  }

  Widget _buildTile(IconData icon, String title, bool isDark, {Widget? trailing}) {
    return ListTile(
      leading: Icon(icon, color: isDark ? Colors.white : Colors.black),
      title: Text(title, style: TextStyle(color: isDark ? Colors.white : Colors.black)),
      trailing: trailing ?? Icon(Icons.arrow_forward, color: isDark ? Colors.white : Colors.black),
      onTap: () {},
    );
  }

  Widget _buildSubtitleTile(IconData icon, String title, String subtitle, bool isDark) {
    return ListTile(
      leading: Icon(icon, color: isDark ? Colors.white : Colors.black),
      title: Text(title, style: TextStyle(color: isDark ? Colors.white : Colors.black)),
      subtitle: Text(subtitle, style: TextStyle(color: isDark ? Colors.white70 : Colors.grey)),
      trailing: Icon(Icons.edit, color: isDark ? Colors.white : Colors.black),
      onTap: () {},
    );
  }

  Widget _buildSwitchTile(IconData icon, String title, bool value, bool isDark) {
    return ListTile(
      leading: Icon(icon, color: isDark ? Colors.white : Colors.black),
      title: Text(title, style: TextStyle(color: isDark ? Colors.white : Colors.black)),
      trailing: Switch(
        value: value,
        onChanged: (_) {},
        activeColor: Color.fromARGB(255, 169, 121, 121),
      ),
    );
  }
}
