import 'package:chateo/src/packages/data/account/lib/src/domain/auth/login_with_email_exception.dart';
import 'package:chateo/src/packages/features/login/login.dart';
import 'package:chateo/src/packages/features/login/widgets/onboarding_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../core/ui/ui.dart';
import '../widgets/social_media_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final bloc = context.read<LoginBloc>();

    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(ChateoDimens.dimen_20),
            children: [
              const SizedBox(height: ChateoDimens.dimen_20),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Log in',
                  style: textTheme.labelLarge?.copyWith(
                    decoration: TextDecoration.underline,
                    decorationThickness: 10,
                    decorationColor: theme.colorScheme.primary.withOpacity(0.7),
                  ),
                  children: [
                    TextSpan(
                      text: ' to Chateo',
                      style: textTheme.labelLarge?.copyWith(
                        decoration: null,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: ChateoDimens.dimen_20),
              Text(
                'Welcome back! Sign in using your social account or email to continue us',
                style: TextStyle(
                  color: ChateoColors.darkGrey,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: ChateoDimens.dimen_24,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialMediaButton(
                      iconPath: ChateDrawables.getFacebookIconDrawable(),
                    ),
                    const SizedBox(
                      width: ChateoDimens.dimen_16,
                    ),
                    SocialMediaButton(
                      iconPath: ChateDrawables.getGoogleIconDrawable(),
                      onTap: () => context
                          .read<SignInBloc>()
                          .add(const LogInWithGoogleEvent()),
                    ),
                    const SizedBox(
                      width: ChateoDimens.dimen_16,
                    ),
                    SocialMediaButton(
                      iconPath: ChateDrawables.getAppleIconDrawable(),
                    ),
                  ],
                ),
              ),
              OnboardingDivider(
                color: ChateoColors.darkGrey,
              ),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return TextFormField(
                    textInputAction: TextInputAction.next,
                    onChanged: (value) =>
                        bloc.add(ChangeEmailLoginEvent(value)),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      label: const Text('Your email'),
                      error: state.showErrorEmail
                          ? const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Invalid email address",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            )
                          : null,
                    ),
                  );
                },
              ),
              const SizedBox(height: ChateoDimens.dimen_16),
              TextFormField(
                textInputAction: TextInputAction.done,
                onChanged: (value) => bloc.add(ChangePasswordLoginEvent(value)),
                obscureText: true,
                decoration: const InputDecoration(
                  label: Text('Password'),
                ),
              ),
              const SizedBox(height: ChateoDimens.dimen_92),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: ChateoDimens.dimen_20,
                ).copyWith(
                  bottom: ChateoDimens.dimen_48,
                ),
                child: BlocConsumer<LoginBloc, LoginState>(
                  listener: _listenState,
                  builder: (context, state) {
                    if (state.status == Status.loading) {
                      return const SizedBox(
                        height: 100,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return ElevatedButton(
                      onPressed: state.showLogInButton
                          ? () =>
                              bloc.add(const LogInWithEmailAndPasswordEvent())
                          : null,
                      child: const Text('Log in'),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _listenState(BuildContext context, LoginState state) {
    if (state.error is LogInWithEmailAndPasswordException) {
      final msg = (state.error as LogInWithEmailAndPasswordException).message;
      Fluttertoast.showToast(msg: msg);
    }
  }
}


// Column design
// return Scaffold(
//       appBar: AppBar(),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(ChateoDimens.dimen_20),
//           child: Column(
//             // mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               RichText(
//                 textAlign: TextAlign.center,
//                 text: TextSpan(
//                   text: 'Log in',
//                   style: textTheme.labelLarge?.copyWith(
//                     decoration: TextDecoration.underline,
//                     decorationThickness: 10,
//                     decorationColor: theme.colorScheme.primary.withOpacity(0.7),
//                   ),
//                   children: [
//                     TextSpan(
//                       text: ' to Chateo',
//                       style: textTheme.labelLarge,
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: ChateoDimens.dimen_20),
//               Text(
//                 'Welcome back! Sign in using your social account or email to continue us',
//                 style: TextStyle(
//                   color: ChateoColors.darkGrey,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   vertical: ChateoDimens.dimen_24,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SocialMediaButton(
//                       iconPath: ChateDrawables.getFacebookIconDrawable(),
//                     ),
//                     const SizedBox(
//                       width: ChateoDimens.dimen_16,
//                     ),
//                     SocialMediaButton(
//                       iconPath: ChateDrawables.getGoogleIconDrawable(),
//                     ),
//                     const SizedBox(
//                       width: ChateoDimens.dimen_16,
//                     ),
//                     SocialMediaButton(
//                       iconPath: ChateDrawables.getAppleIconDrawable(),
//                     ),
//                   ],
//                 ),
//               ),
//               OnboardingDivider(
//                 color: ChateoColors.darkGrey,
//               ),
//               TextFormField(
//                 textInputAction: TextInputAction.next,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: const InputDecoration(
//                   label: Text('Your email'),
//                 ),
//               ),
//               const SizedBox(height: ChateoDimens.dimen_16),
//               TextFormField(
//                 textInputAction: TextInputAction.done,
//                 obscureText: true,
//                 decoration: const InputDecoration(
//                   label: Text('Password'),
//                 ),
//               ),
//               const SizedBox(height: ChateoDimens.dimen_92),
//               SizedBox(
//                 width: double.infinity,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                           // horizontal: ChateoDimens.dimen_20,
//                           )
//                       .copyWith(
//                     bottom: ChateoDimens.dimen_48,
//                   ),
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     child: const Text('Log in'),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
