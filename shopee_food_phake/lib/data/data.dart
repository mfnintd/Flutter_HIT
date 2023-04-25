import 'food.dart';

class FoodData {
  static List<String> typeOfFood = <String>[
    'Sashimi',
    'Sushi lẻ và tổng hợp',
    'Maki,cơm cuộn',
    'Combo Sashimi + Sushi & Maki + ...',
    'Món nóng, salat',
    'Đồ uống'
  ];

  static List<Food> listFoods = <Food>[
    Food(
      id: 0,
      type: 0,
      imageUlr:
          'https://images.foody.vn/res/g100004/1000032780/s400x400/0c69fb48-1ebc-429c-bd62-aff68bc5-b48f3271-221015221731.jpeg',
      title: 'Lá rong biển cuộn cá 6 lá nhỏ (Nori)',
      describe:
          'Lá rong biển để cuộn cá sống 6 lá nhỏ đủ cuộn miếng cá sashimi',
      numOfSold: 1111,
      numOfLike: 12,
      cost: 8000,
    ),
    Food(
      id: 1,
      type: 0,
      imageUlr:
          'https://images.foody.vn/res/g100004/1000032780/s400x400/59366bbc-94b3-459d-ac95-e2a71812-ee8066ea-221012134801.jpeg',
      title: 'Sashimi cá hồi 10m',
      describe:
          'Kèm chấm , tía tô,mù tạt , gừng :CHÚ Ý(KHÔNG KÈM LÁ RONG BIỂN )',
      numOfSold: 755,
      numOfLike: 14,
      cost: 175000,
    ),
    Food(
      id: 2,
      type: 0,
      imageUlr:
          'https://images.foody.vn/res/g100004/1000032780/s400x400/1116bbce-874c-4c8d-aa52-b8fc6fc3-0fd9e369-221012134944.jpeg',
      title: 'Sashimi cá hồi 6m',
      describe:
          'Có củ cải, chấm , lá tía tô,mù tạt ,gừng ( KHÔNG KÈM LÁ RONG BIỂN )',
      numOfSold: 395,
      numOfLike: 11,
      cost: 110000,
    ),
    Food(
      id: 3,
      type: 0,
      imageUlr:
          'https://images.foody.vn/res/g100004/1000032780/s400x400/e1f3cd5f-eeca-4767-a7bd-f4d67997-2c7d7388-221012134910.jpeg',
      title: 'Sashimi cá hồi 10m + cá trích 10m ( 1-2 người )',
      describe:
          '-Kèm củ cải , chấm , mù tạt, gừng, tía tô ,Cá Trích mầu do quán chọn ngẫu nhiên CHÚ Ý -( không kèm lá rong biển )',
      numOfSold: 363,
      numOfLike: 2,
      cost: 330000,
    ),
    Food(
      id: 4,
      type: 0,
      imageUlr:
          'https://images.foody.vn/res/g100004/1000032780/s400x400/66ac6987-57d4-493e-92cf-295d6a6e-fd9e15dc-211106010405.jpeg',
      title: 'Gừng sushi 50g',
      describe: '',
      numOfSold: 212,
      numOfLike: 4,
      cost: 15000,
    ),
    Food(
      id: 5,
      type: 0,
      imageUlr:
          'https://images.foody.vn/res/g100004/1000032780/s400x400/1f8a21eb-f82a-493b-a3b7-238c59b0-eb750c14-221012135139.jpeg',
      title: 'Sashimi cá trích 6m',
      describe:
          '-Shop bán mầu tự nhiên , khách muốn chọn mầu thì báo shop ah! Kèm tía tô ,chấm , mù tạt,gừng CHÚ Ý -( không kèm lá rong biển)',
      numOfSold: 153,
      numOfLike: 5,
      cost: 110000,
    ),
    Food(
      id: 6,
      type: 0,
      imageUlr:
          'https://images.foody.vn/res/g100004/1000032780/s400x400/7762df06-1157-4607-898c-cd4dfaef-a39f8883-221012135033.jpeg',
      title: 'Sashimi E : cá hồi 10m + cá trích 10m+ sò lửa 6 miếng (2 người )',
      describe:
          '-Kèm củ cải, chấm , lá tía tô,mù tạt, gừng ,Cá Trích mầu do quán chọn ngẫu nhiên . CHÚ Ý -( không kèm lá rong biển ) Sò lửa 6 miếng = 3 con',
      numOfSold: 149,
      numOfLike: 4,
      cost: 400000,
    ),
    Food(
      id: 7,
      type: 0,
      imageUlr:
          'https://images.foody.vn/res/g100004/1000032780/s400x400/66a6b0ad-ef9f-4cee-b245-e4531f15-1ebdcf63-221012135118.jpeg',
      title: 'Sashimi G :cá hồi 10m + cá trích 5m + bạch tuộc 5m( 1-2 người )',
      describe:
          '-Kèm củ cải , chấm , tía tô,mù tạt,gừng , Cá Trích mầu do quán chọn ngẫu nhiên . CHÚ Ý - (không kèm lá rong biển )',
      numOfSold: 124,
      numOfLike: 3,
      cost: 305000,
    ),
    Food(
      id: 8,
      type: 0,
      imageUlr:
          'https://images.foody.vn/res/g100004/1000032780/s400x400/1beac6d7-ad63-4ce7-a086-af2ab125-bdc54197-221012135220.jpeg',
      title: 'Sashimi cá hồi 3, sò lửa 3 miếng, cá trích 3',
      describe:
          '- Kèm củ cải , chấm , tía tô, mù tạt,gừng ,Cá Trích mầu do quán chọn ngẫu nhiên CHÚ Ý - ( không kèm lá rong biển ) Sò lửa 3 miếng = 1,5 con',
      numOfSold: 111,
      numOfLike: 1,
      cost: 175000,
    ),
    Food(
      id: 9,
      type: 1,
      imageUlr:
          'https://images.foody.vn/res/g100004/1000032780/s400x400/697f9108-9462-4bd9-b97f-1c023888-91ee1286-210927143024.jpeg',
      title: 'Sushi lươn 2m',
      describe: 'Kèm chấm , mù tạt, gừng ',
      numOfSold: 291,
      numOfLike: 6,
      cost: 47000,
    ),
    Food(
      id: 10,
      type: 1,
      imageUlr:
          'https://images.foody.vn/res/g100004/1000032780/s400x400/52af5365-77ee-4d42-951c-3dbceafc-89c27450-210927133611.jpeg',
      title: 'Gunkan sushi trứng cá chuồn 2 viên )',
      describe: 'Kèm chấm , mù tạt, gừng ',
      numOfSold: 274,
      numOfLike: 2,
      cost: 37000,
    ),
    Food(
      id: 11,
      type: 1,
      imageUlr:
          'https://images.foody.vn/res/g100004/1000032780/s400x400/72c9ef1f-bdc5-454b-b3c0-14089092-32139672-210927133351.jpeg',
      title: 'Sushi cá hồi 5 viên ',
      describe: 'Kèm chấm , mù tạt, gừng. Có thể khác hình một chút',
      numOfSold: 223,
      numOfLike: 8,
      cost: 75000,
    ),
    Food(
      id: 12,
      type: 1,
      imageUlr:
          'https://images.foody.vn/res/g100004/1000032780/s400x400/e2574a3b-ce7a-4949-b188-4772bf3a-579080e4-220818113021.jpeg',
      title: 'Sushi G : tổng hợp 27 viên (2-3 người )',
      describe:
          'Có thể khác hình một chút  Sushi tổng hợp : 6 viên cá hồi cuộn, 6 viên cuộn califorlia, Sushi (3 trứng,4 cá trích mầu ngẫu nhiên ,2 tôm ,4cá hồi tái,2 cá hồi.) Kèm chấm , mù tạt, gừng',
      numOfSold: 201,
      numOfLike: 5,
      cost: 285000,
    ),
    Food(
      id: 13,
      type: 1,
      imageUlr:
          'https://images.foody.vn/res/g100004/1000032780/s400x400/dc4cffa5-2d81-4766-ac0d-53fdf64f-35934895-221012141421.jpeg',
      title: 'Sushi D: tổng hợp 16 viên (1 người )',
      describe:
          'Mix sushi 16 miếng :2 thanh của , 2trứng ngọt ,2 cá hồi, 1 cá hồi tái ,1bạch tuộc ,1 cá trích mầu ngẫu nhiên ,1 tôm ,6 viên cuộn thanh cua (có thể khác hình  một chút ) Kèm chấm , mù tạt, gừng',
      numOfSold: 201,
      numOfLike: 4,
      cost: 155000,
    ),
    Food(
      id: 14,
      type: 1,
      imageUlr:
          'https://images.foody.vn/res/g100004/1000032780/s400x400/321f44fb-0a85-4015-9742-a39f03e4-c72eb843-210926224702.jpeg',
      title: 'Sushi cá trích 2 viên',
      describe:
          'Kèm chấm , mù tạt, gừng ( mầu do quán chọn ngẫu nhiên đỏ hoặc vàng )',
      numOfSold: 198,
      numOfLike: 6,
      cost: 29000,
    ),
    Food(
      id: 15,
      type: 1,
      imageUlr:
          'https://images.foody.vn/res/g100004/1000032780/s400x400/f19eb8b4-8497-499d-abea-e5ebd563-f1e1d9ff-210927142952.jpeg',
      title: 'Sushi cá hồi 2 viên',
      describe: 'Kèm chấm , mù tạt, gừng',
      numOfSold: 172,
      numOfLike: 3,
      cost: 30000,
    ),
    Food(
      id: 16,
      type: 2,
      imageUlr:
          'https://images.foody.vn/res/g100004/1000032780/s400x400/51216353-50a3-4ba2-9fc0-b5f4422a-852da9ab-221112124854.jpeg',
      title: 'Cơm cuộn kiểu califorlia 8 viên -roll',
      describe: 'Kèm chấm , mù tạt, gừng',
      numOfSold: 158,
      numOfLike: 6,
      cost: 65000,
    ),
    Food(
      id: 17,
      type: 2,
      imageUlr:
          'https://images.foody.vn/res/g100004/1000032780/s400x400/21de36af-7e41-4246-b31c-4631296d-859cfb4a-210927134739.jpeg',
      title: 'Cơm cuộn cá hồi 6 viên (maki)',
      describe: 'Kèm chấm , mù tạt, gừng',
      numOfSold: 158,
      numOfLike: 4,
      cost: 37000,
    ),
    Food(
      id: 18,
      type: 2,
      imageUlr:
          'https://images.foody.vn/res/g100004/1000032780/s400x400/61ee9be0-f2cc-4a22-a5f5-73f6b060-a42cfe28-221012200244.jpeg',
      title: 'Cơm cuộn Cá Hồi với bơ quả 6 viên ( sake avocado maki)',
      describe: 'Kèm chấm , mù tạt , gừng',
      numOfSold: 113,
      numOfLike: 7,
      cost: 38000,
    ),
    Food(
      id: 19,
      type: 2,
      imageUlr:
          'https://images.foody.vn/res/g100004/1000032780/s400x400/9d6b5767-17bb-40d0-9566-78ba2a93-7b3f80d6-221012195454.jpeg',
      title: 'Cơm cuộn kiểu Califorlia 8 viên+cuộn cá Hồi 6 viên',
      describe: 'Kèm chấm , mù tạt , gừng',
      numOfSold: 112,
      numOfLike: 3,
      cost: 105000,
    ),
    Food(
      id: 20,
      type: 2,
      imageUlr:
          'https://images.foody.vn/res/g100004/1000032780/s400x400/1995cc50-29bb-4fa9-ac49-084337df-2aa9db81-221119210800.jpeg',
      title: 'Cơm cuộn phủ lươn 8 viên (roll)',
      describe: 'Kèm chấm , mù tạt, gừng',
      numOfSold: 108,
      numOfLike: 0,
      cost: 110000,
    ),
    Food(
      id: 21,
      type: 3,
      imageUlr:
          'https://images.foody.vn/res/g100004/1000032780/s400x400/885020fe-aca6-4e63-bbd6-f9fd8f63-1a2ae9ab-221112140645.jpeg',
      title:
          'Combo B: Sashimi cá hồi 10 + cơm cuộn cá hồi 6 + cuộn Califorlia 8 (1-2 người )',
      describe: 'Kèm chấm , gừng, mù tạt,tía tô -Chú ý không kèm lá rong biển',
      numOfSold: 58,
      numOfLike: 1,
      cost: 265000,
    ),
    Food(
      id: 22,
      type: 3,
      imageUlr:
          'https://images.foody.vn/res/g100004/1000032780/s400x400/94f94eeb-b56e-4fc4-a94e-3edf439e-af60e80a-221012210741.jpeg',
      title:
          'Combo E: Sashimi cá hồi 6 miếng + sushi ( lươn 2, cá trích 2, trứng cá chuồn 2 )',
      describe:
          '(1 người ) Kèm chấm , mù tạt, gừng,tía tô, củ cải. Cá trích mầu ngẫu nhiên đỏ hoặc vàng Chú ý không kèm lá rong biển',
      numOfSold: 45,
      numOfLike: 0,
      cost: 210000,
    ),
    Food(
      id: 23,
      type: 3,
      imageUlr:
          'https://images.foody.vn/res/g100004/1000032780/s400x400/17259b84-9bbb-464f-abbc-67bf35f8-5829ac3a-221012210940.jpeg',
      title: 'Combo N: sashimi cá hồi 10 miếng + sushi cá hồi 5 viên',
      describe:
          'Kèm chấm, mù tạt, gừng, tía tô, củ cải  Chú ý không kèm lá rong biển',
      numOfSold: 29,
      numOfLike: 0,
      cost: 245000,
    ),
    Food(
      id: 24,
      type: 4,
      imageUlr:
          'https://images.foody.vn/res/g100004/1000032780/s400x400/adc2d770-e838-44f3-b9b2-817c1c28-f45765a1-210927133802.jpeg',
      title: 'Súp miso nhật ',
      describe: 'Súp miso Nhật nhân thay đổi theo ngày',
      numOfSold: 536,
      numOfLike: 8,
      cost: 20000,
    ),
    Food(
      id: 25,
      type: 4,
      imageUlr:
          'https://images.foody.vn/res/g100004/1000032780/s400x400/422df3d7-ad09-4de1-ad70-3defc2d0-2cd52b94-220210203055.jpeg',
      title: 'Salat rong biển trộn mè trứng cua(115g rong  biển)',
      describe: '115g salad rong biển',
      numOfSold: 527,
      numOfLike: 13,
      cost: 60000,
    ),
    Food(
      id: 26,
      type: 4,
      imageUlr:
          'https://images.foody.vn/res/g100004/1000032780/s400x400/835bf014-2f6c-40b7-be1f-ae9addb0-7d4c6495-221004124541.jpeg',
      title: 'Cơm lươn Nhật( Unagi don )',
      describe: 'Lươn 100g Cơm 300g Chú ý : không kèm súp',
      numOfSold: 506,
      numOfLike: 10,
      cost: 155000,
    ),
    Food(
      id: 27,
      type: 5,
      imageUlr:
          'https://images.foody.vn/res/g100004/1000032780/s400x400/d54a0048-e590-45e2-846a-23a43a57-de6dcbb6-210928220336.jpeg',
      title: 'Coca cola',
      describe: '',
      numOfSold: 108,
      numOfLike: 2,
      cost: 15000,
    ),
    Food(
      id: 28,
      type: 5,
      imageUlr:
          'https://images.foody.vn/res/g100004/1000032780/s400x400/6334f540-8c88-4cb0-bee8-31a9b0a4-830f62df-210927174727.jpeg',
      title: 'Lavie nhỏ',
      describe: '',
      numOfSold: 14,
      numOfLike: 2,
      cost: 10000,
    ),
  ];
}
